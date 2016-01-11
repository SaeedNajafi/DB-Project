
DELIMITER //
CREATE TRIGGER check_player_age BEFORE INSERT ON player 
FOR EACH ROW
BEGIN
  DECLARE dob_date date;
  DECLARE years_old int;
  DECLARE forbidden_age CONDITION FOR SQLSTATE '22012';
  
  SET dob_date = new.birth_date;
  
  SET years_old= TIMESTAMPDIFF (year, dob_date,now());
  
  IF ( years_old <= 18 ) THEN
      SIGNAL forbidden_age
      SET MESSAGE_TEXT = 'player age must be greater than 18';
  
  ELSE     
         SET new.age = years_old;
  End IF;
END//

DELIMITER ;
DELIMITER //


CREATE TRIGGER check_referee_cond BEFORE INSERT ON referee_match 
FOR EACH ROW

BEGIN
  DECLARE referee_num int;
  Declare current_exp int;
  DEclare referee_exp int;
  DECLARE max_referee_error CONDITION FOR SQLSTATE '22042';
  
  set referee_num=(SELECT COUNT(*) from referee_match where match_id=new.match_id);
  IF (referee_num >=7 ) THEN
      SIGNAL max_referee_error
      SET MESSAGE_TEXT = 'number of referees for each match cannot be greater than 7!!';
  End IF;
  
  set current_exp=(select referee.match_num from referee 
                                       inner join mmatch on (mmatch.first_referee_id=referee.id)
                                       where mmatch.id=new.match_id);

  set referee_exp=(select referee.match_num from referee 
                         where referee.id=new.referee_id);

  if(referee_exp>current_exp OR current_exp is NULL) then
   update mmatch set mmatch.first_referee_id=new.referee_id
           where mmatch.id=new.match_id;
  end if;

END //


DELIMITER ;
DELIMITER //

CREATE TRIGGER check_match_time BEFORE INSERT ON mmatch
FOR EACH ROW
BEGIN

  DECLARE simultaneous_match_id int;
  DECLARE simultaneous_match_error CONDITION FOR SQLSTATE '22042';
  
  set simultaneous_match_id=(SELECT mmatch.id from mmatch
                              where mmatch.date=new.date and
                               ( ( new.time between mmatch.time and (mmatch.time + mmatch.duration) ) or ( (new.time + new.duration) between mmatch.time and (mmatch.time + mmatch.duration) ) )
			    );
                             
  if(simultaneous_match_id is not null) then
      SIGNAL simultaneous_match_error
      SET MESSAGE_TEXT = 'there is another match at this time!!';
  end if;
END//


DELIMITER ;
DELIMITER //

CREATE TRIGGER update_referee_match_num AFTER insert ON referee_match 
FOR EACH ROW
BEGIN

  update referee 
  set match_num=match_num+1 
  where referee.id=new.referee_id;
  
END//

DELIMITER ;
DELIMITER //

create procedure update_team_set_ratio(winner_id int,loser_id int,match_id int)
begin
     
     declare winner_lost_sets int;
     declare loser_lost_sets int;

     update team set team.won_sets=team.won_sets+1 where team.id=winner_id;
     update team set team.lost_sets=team.lost_sets+1 where team.id=loser_id;

     set winner_lost_sets=(select lost_sets from team where id=winner_id);
     set loser_lost_sets=(select lost_sets from team where id=loser_id);

     if(winner_lost_sets>0 and loser_lost_sets>0) then
     update team set set_ratio=won_sets/lost_sets where id=winner_id or id=loser_id;
     end if;
end//

DELIMITER ;
DELIMITER //

create procedure update_team1_score(team1_id int,team2_id int,match_id int)
begin
     update mmatch set mmatch.team1_score=mmatch.team1_score+1
            where mmatch.id=match_id;
     call update_team_set_ratio(team1_id,team2_id,match_id);
end//

DELIMITER ;

DELIMITER //

create procedure update_team2_score(team2_id int,team1_id int,match_id int)
begin
     update mmatch set mmatch.team2_score=mmatch.team2_score+1
            where mmatch.id=match_id;
     call update_team_set_ratio(team2_id,team1_id,match_id);

end//


DELIMITER ;

DELIMITER //

CREATE TRIGGER update_match_score AFTER INSERT ON sset 
FOR EACH ROW
BEGIN
  DECLARE forbidden_score CONDITION FOR SQLSTATE '22012';
  DECLARE team1_id int;
  DECLARE team2_id int;
  set team1_id=(select mmatch.team1_id from mmatch where mmatch.id=new.match_id);
  set team2_id=(select mmatch.team2_id from mmatch where mmatch.id=new.match_id);
  

	
  update team set team.won_points=team.won_points+new.team1_points,team.lost_points=team.lost_points+new.team2_points where team.id=team1_id;
  update team set team.won_points=team.won_points+new.team2_points,team.lost_points=team.lost_points+new.team1_points where team.id=team2_id;


  update team set team.point_ratio=team.won_points/team.lost_points where team.id=team1_id or team.id=team2_id;



  
  if(new.team1_points>new.team2_points) then
   call update_team1_score(team1_id,team2_id,new.match_id);
  elseif(new.team1_points<new.team2_points) then
   call update_team2_score(team2_id,team1_id,new.match_id);
  else
      SIGNAL forbidden_score
      SET MESSAGE_TEXT = 'score points should not be same';
  END IF;

END//

DELIMITER ;


DELIMITER //

create procedure update_team_score_after_match(team1_id int,team2_id int,team1_final_score int,team2_final_score int)
begin
     if(team1_final_score=3 or team1_final_score=2) then
           update team set team.won_matches=team.won_matches+1,team.score=team.score+team1_final_score where team.id=team1_id;
           update team set team.lost_matches=team.lost_matches+1,team.score=team.score+team2_final_score where team.id=team2_id;
     else 
           update team set team.won_matches=team.won_matches+1,team.score=team.score+team2_final_score where team.id=team2_id;
           update team set team.lost_matches=team.lost_matches+1,team.score=team.score+team1_final_score where team.id=team1_id;
     end if;     
end//

DELIMITER ;

DELIMITER //

create procedure update_teams_final_scores()
begin
  DECLARE done INT DEFAULT FALSE;
  DECLARE team1_id,team2_id,team1_score,team2_score INT;
  declare team1_final_score,team2_final_score INT default 0;
  DECLARE illegal_score_error CONDITION FOR SQLSTATE '22042';
  DECLARE cur1 CURSOR FOR SELECT mmatch.team1_id,mmatch.team2_id,mmatch.team1_score,mmatch.team2_score FROM dbproject.mmatch;
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
  update team set won_matches=0,lost_matches=0,score=0;
  OPEN cur1;
  read_loop: LOOP
    FETCH cur1 INTO team1_id,team2_id,team1_score,team2_score;
    IF done THEN
      LEAVE read_loop;
    END IF;
    case 
           when (team1_score=3) then
                if(team2_score=2) then
                      set team1_final_score=2;
                      set team2_final_score=1;
                else
                 set team1_final_score=3;
                end if; 
                call update_team_score_after_match(team1_id,team2_id,team1_final_score,team2_final_score);
          when (team1_score=2 and team2_score=3) then
                set team1_final_score=1;
                set team2_final_score=2;
                call update_team_score_after_match(team1_id,team2_id,team1_final_score,team2_final_score);
          when (team1_score=1 and team2_score=3) then
                set team1_final_score=0;
                set team2_final_score=3;
                call update_team_score_after_match(team1_id,team2_id,team1_final_score,team2_final_score);
          when (team1_score=0 and team2_score=3) then
                set team1_final_score=0;
                set team2_final_score=3;
                call update_team_score_after_match(team1_id,team2_id,team1_final_score,team2_final_score);
          else
                SIGNAL illegal_score_error
                SET MESSAGE_TEXT = 'score is not valid!!';
   end case;                             
  END LOOP;
  CLOSE cur1;

END//





DELIMITER ;






