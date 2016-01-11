

DELIMITER //


create procedure query_1_date(ddate date)
begin
	select count(id) as num
	from mmatch
	where date=ddate; 
end//

DELIMITER ;
DELIMITER //



create procedure query_1_name(stadium_name varchar(255))
begin
	select count(mmatch.id) as num
	from mmatch, stadium
	where mmatch.stadium_id=stadium.id and stadium.name=stadium_name; 
end//


DELIMITER ;
DELIMITER //


create procedure query_2(ddate date)

begin

select player.name as player_name, team.name as team_name, player.birth_date as player_birth_date
from player,team, (select match_id as match_id2 , player_id as player_id2, team_id as team_id2
		 from player_match, (select match_id as id1, max(attack_num) as num1
		    from player_match
                    group by match_id) as temp1

where match_id=temp1.id1 and attack_num=temp1.num1
having match_id in (select id 
                    from mmatch
                    where date=ddate)) as temp2

where player.id=temp2.player_id2 and player.team_id=temp2.team_id2 and team.id=temp2.team_id2;

end//

DELIMITER ;
DELIMITER //

create procedure query_3(player_name varchar(255))

begin


select name
from referee,(select distinct referee_match.referee_id as id
	      from referee_match,(select distinct match_id as match_id
				  from player_match, (select id as id
						      from player 
						      where name=player_name) as temp1
				  where player_match.player_id=temp1.id) as temp2
	      where referee_match.match_id=temp2.match_id) as temp3
where referee.id=temp3.id;

end//


DELIMITER ;
DELIMITER //



create procedure query_4(ffrom date, tto date)
begin

 

select name, match_id
from player, (select match_id as match_id, player_id as player_id
	      from player_match,(select match_id  as id, max(block_num) as num
		                 from player_match
	                         group by match_id) as temp1 
              where match_id=temp1.id and block_num=temp1.num
              having match_id in (select id 
                                  from mmatch
                                  where date between ffrom and tto ) ) as temp2
where player.id=temp2.player_id;
	
end//



DELIMITER ;
DELIMITER //



create procedure query_5()
begin

	call update_teams_final_scores();
	select * from team;
end//


DELIMITER ;
DELIMITER //



create procedure query_6()
begin

create view temp1(id) as
select id 
from player
where id not in (
                select distinct player_id
                from player_match
                where serve_num>0
                );
                
select name
from player, temp1
where player.id=temp1.id;

drop view temp1;
end//


DELIMITER ;
DELIMITER //



create procedure query_7()
begin

create view temp1(id,total_attacks,total_blocks) as
select player_id, sum(attack_num), sum(block_num)
from player_match
group by player_id;

select name
from player, temp1
where player.id=temp1.id and temp1.total_blocks > temp1.total_attacks;

drop view temp1;



end//


DELIMITER ;
DELIMITER //


create procedure query_8()
begin

create view temp1(match_id, team_id, sum_serve,sum_attack,sum_block) as
select match_id, team_id, sum(serve_num), sum(attack_num), sum(block_num)
from player_match
group by match_id, team_id;

create view temp2(match_id, team_id, sum_points) as
select match_id, team_id, sum_serve + sum_attack + sum_block
from temp1;

select name, id
from team as T
where T.id not in (
                    select distinct team_id
                    from temp2
                    where temp2.sum_points <= 20  and temp2.team_id=T.id
                    );
                
drop view temp1;
drop view temp2;


end//

DELIMITER ;



