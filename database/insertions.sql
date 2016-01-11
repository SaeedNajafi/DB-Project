insert into referee(name,match_num) values("Najafi",2);
insert into referee(name,match_num) values("Albooye",4);
insert into referee(name,match_num) values("Ameri",5);
insert into referee(name,match_num) values("Javadi",1);
insert into referee(name,match_num) values("Gaderi",12);
insert into referee(name,match_num) values("Nazeri",11);
insert into referee(name,match_num) values("Nazaryani",6);
insert into referee(name,match_num) values("kazemi",1);
insert into referee(name,match_num) values("Hamdam",4);
insert into referee(name,match_num) values("Mogadam",5);
insert into referee(name,match_num) values("Safa",10);
insert into referee(name,match_num) values("Miri",9);
insert into referee(name,match_num) values("Natars",6);
insert into referee(name,match_num) values("Turkei",4);
insert into referee(name,match_num) values("Bartar",13);
insert into referee(name,match_num) values("Esfandiyari",6);



insert into stadium(name) values("Azadi");
insert into stadium(name) values("Ultraford");
insert into stadium(name) values("Newcamp");
insert into stadium(name) values("Aliensarena");
insert into stadium(name) values("Emirates");
insert into stadium(name) values("Santiyago");



insert into team(name) values("Iran");
insert into team(name) values("Brazil");
insert into team(name) values("USA");
insert into team(name) values("Japan");



insert into player(name,team_id,is_captain,birth_date) values("Gasem",1,false,"1990-01-30");
insert into player(name,team_id,is_captain,birth_date) values("Jafar",1,false,"1991-11-21");
insert into player(name,team_id,is_captain,birth_date) values("Reza",1,false,"1986-05-14");
insert into player(name,team_id,is_captain,birth_date) values("Saeed",1,false,"1982-10-20");
insert into player(name,team_id,is_captain,birth_date) values("Marjan",1,true,"1989-01-03");
insert into player(name,team_id,is_captain,birth_date) values("Milad",1,false,"1989-09-26");


insert into player(name,team_id,is_captain,birth_date) values("Dani",2,false,"1990-08-08");
insert into player(name,team_id,is_captain,birth_date) values("Kaka",2,true,"1991-09-01");
insert into player(name,team_id,is_captain,birth_date) values("Ronaldo",2,false,"1990-07-16");
insert into player(name,team_id,is_captain,birth_date) values("Meri",2,false,"1992-01-17");
insert into player(name,team_id,is_captain,birth_date) values("Porto",2,false,"1993-01-23");
insert into player(name,team_id,is_captain,birth_date) values("Rivaldo",2,false,"1989-05-11");


insert into player(name,team_id,is_captain,birth_date) values("Alen",3,false,"1989-11-08");
insert into player(name,team_id,is_captain,birth_date) values("Criss",3,false,"1989-10-10");
insert into player(name,team_id,is_captain,birth_date) values("John",3,false,"1987-01-24");
insert into player(name,team_id,is_captain,birth_date) values("Beth",3,false,"1987-05-25");
insert into player(name,team_id,is_captain,birth_date) values("Joseph",3,false,"1992-03-12");
insert into player(name,team_id,is_captain,birth_date) values("Bill",3,true,"1991-09-21");


insert into player(name,team_id,is_captain,birth_date) values("Soushi",4,false,"1988-11-08");
insert into player(name,team_id,is_captain,birth_date) values("Yani",4,false,"1990-08-20");
insert into player(name,team_id,is_captain,birth_date) values("Yoyo",4,true,"1986-02-14");
insert into player(name,team_id,is_captain,birth_date) values("Iaho",4,false,"1986-06-15");
insert into player(name,team_id,is_captain,birth_date) values("Yuo",4,false,"1992-04-22");
insert into player(name,team_id,is_captain,birth_date) values("Yova",4,false,"1991-09-21");



insert into mmatch(date,time,duration,team1_id,team2_id,stadium_id, first_referee_id) values("2016-10-10","20:00:00","2:30:00", 1,2,1,1);
insert into mmatch(date,time,duration,team1_id,team2_id,stadium_id, first_referee_id) values("2016-10-11","20:00:00","2:30:00", 1,3,2,1);
insert into mmatch(date,time,duration,team1_id,team2_id,stadium_id, first_referee_id) values("2016-10-12","20:00:00","2:30:00", 1,4,3,1);
insert into mmatch(date,time,duration,team1_id,team2_id,stadium_id, first_referee_id) values("2016-10-13","20:00:00","2:30:00", 2,3,1,1);
insert into mmatch(date,time,duration,team1_id,team2_id,stadium_id, first_referee_id) values("2016-10-14","20:00:00","2:30:00", 2,4,3,1);
insert into mmatch(date,time,duration,team1_id,team2_id,stadium_id, first_referee_id) values("2016-10-15","20:00:00","2:30:00", 3,4,5,1);



insert into referee_match(match_id,referee_id) values(1,1);
insert into referee_match(match_id,referee_id) values(1,2);
insert into referee_match(match_id,referee_id) values(1,4);
insert into referee_match(match_id,referee_id) values(1,6);
insert into referee_match(match_id,referee_id) values(1,10);
insert into referee_match(match_id,referee_id) values(1,5);
insert into referee_match(match_id,referee_id) values(1,7);


insert into referee_match(match_id,referee_id) values(2,2);
insert into referee_match(match_id,referee_id) values(2,3);
insert into referee_match(match_id,referee_id) values(2,5);
insert into referee_match(match_id,referee_id) values(2,11);
insert into referee_match(match_id,referee_id) values(2,13);
insert into referee_match(match_id,referee_id) values(2,15);
insert into referee_match(match_id,referee_id) values(2,7);


insert into referee_match(match_id,referee_id) values(3,16);
insert into referee_match(match_id,referee_id) values(3,1);
insert into referee_match(match_id,referee_id) values(3,3);
insert into referee_match(match_id,referee_id) values(3,4);
insert into referee_match(match_id,referee_id) values(3,10);
insert into referee_match(match_id,referee_id) values(3,9);
insert into referee_match(match_id,referee_id) values(3,2);


insert into referee_match(match_id,referee_id) values(4,1);
insert into referee_match(match_id,referee_id) values(4,6);
insert into referee_match(match_id,referee_id) values(4,10);
insert into referee_match(match_id,referee_id) values(4,15);
insert into referee_match(match_id,referee_id) values(4,14);
insert into referee_match(match_id,referee_id) values(4,13);
insert into referee_match(match_id,referee_id) values(4,2);


insert into referee_match(match_id,referee_id) values(5,7);
insert into referee_match(match_id,referee_id) values(5,3);
insert into referee_match(match_id,referee_id) values(5,2);
insert into referee_match(match_id,referee_id) values(5,8);
insert into referee_match(match_id,referee_id) values(5,9);
insert into referee_match(match_id,referee_id) values(5,12);
insert into referee_match(match_id,referee_id) values(5,4);


insert into referee_match(match_id,referee_id) values(6,1);
insert into referee_match(match_id,referee_id) values(6,3);
insert into referee_match(match_id,referee_id) values(6,2);
insert into referee_match(match_id,referee_id) values(6,5);
insert into referee_match(match_id,referee_id) values(6,9);
insert into referee_match(match_id,referee_id) values(6,16);
insert into referee_match(match_id,referee_id) values(6,4);


insert into sset(match_id, set_num, team1_points, team2_points) values(1,1,25,20);
insert into sset(match_id, set_num, team1_points, team2_points) values(1,2,26,24);
insert into sset(match_id, set_num, team1_points, team2_points) values(1,3,25,18);


insert into sset(match_id, set_num, team1_points, team2_points) values(2,1,25,23);
insert into sset(match_id, set_num, team1_points, team2_points) values(2,2,27,25);
insert into sset(match_id, set_num, team1_points, team2_points) values(2,3,22,25);
insert into sset(match_id, set_num, team1_points, team2_points) values(2,4,25,21);


insert into sset(match_id, set_num, team1_points, team2_points) values(3,1,25,23);
insert into sset(match_id, set_num, team1_points, team2_points) values(3,2,22,25);
insert into sset(match_id, set_num, team1_points, team2_points) values(3,3,25,23);
insert into sset(match_id, set_num, team1_points, team2_points) values(3,4,19,25);
insert into sset(match_id, set_num, team1_points, team2_points) values(3,5,15,10);


insert into sset(match_id, set_num, team1_points, team2_points) values(4,1,19,25);
insert into sset(match_id, set_num, team1_points, team2_points) values(4,2,23,25);
insert into sset(match_id, set_num, team1_points, team2_points) values(4,3,15,25);

insert into sset(match_id, set_num, team1_points, team2_points) values(5,1,19,25);
insert into sset(match_id, set_num, team1_points, team2_points) values(5,2,23,25);
insert into sset(match_id, set_num, team1_points, team2_points) values(5,3,25,23);
insert into sset(match_id, set_num, team1_points, team2_points) values(5,4,28,26);
insert into sset(match_id, set_num, team1_points, team2_points) values(5,5,13,15);


insert into sset(match_id, set_num, team1_points, team2_points) values(6,1,25,21);
insert into sset(match_id, set_num, team1_points, team2_points) values(6,2,23,25);
insert into sset(match_id, set_num, team1_points, team2_points) values(6,3,19,25);
insert into sset(match_id, set_num, team1_points, team2_points) values(6,4,18,25);



insert into player_match values(1,1,1,4,9,5);
insert into player_match values(1,1,2,0,10,6);
insert into player_match values(1,1,3,2,4,4);
insert into player_match values(1,1,4,4,7,3);
insert into player_match values(1,1,5,0,4,3);
insert into player_match values(1,1,6,3,8,0);


insert into player_match values(1,2,7,2,5,5);
insert into player_match values(1,2,8,3,2,4);
insert into player_match values(1,2,9,2,9,3);
insert into player_match values(1,2,10,3,3,1);
insert into player_match values(1,2,11,0,7,2);
insert into player_match values(1,2,12,0,5,6);


insert into player_match values(2,1,1,4,14,8);
insert into player_match values(2,1,2,3,10,7);
insert into player_match values(2,1,3,3,3,10);
insert into player_match values(2,1,4,5,5,3);
insert into player_match values(2,1,5,1,8,4);
insert into player_match values(2,1,6,2,7,2);


insert into player_match values(2,3,13,2,5,8);
insert into player_match values(2,3,14,3,11,2);
insert into player_match values(2,3,15,1,10,7);
insert into player_match values(2,3,16,5,8,4);
insert into player_match values(2,3,17,3,7,9);
insert into player_match values(2,3,18,0,6,3);


insert into player_match values(3,1,1,4,19,8);
insert into player_match values(3,1,2,3,10,9);
insert into player_match values(3,1,3,5,4,10);
insert into player_match values(3,1,4,3,6,4);
insert into player_match values(3,1,5,2,8,5);
insert into player_match values(3,1,6,1,4,1);


insert into player_match values(3,4,19,4,9,5);
insert into player_match values(3,4,20,2,15,4);
insert into player_match values(3,4,21,3,4,8);
insert into player_match values(3,4,22,4,10,9);
insert into player_match values(3,4,23,4,8,6);
insert into player_match values(3,4,24,1,9,5);


insert into player_match values(4,2,7,2,4,3);
insert into player_match values(4,2,8,1,4,4);
insert into player_match values(4,2,9,1,5,4);
insert into player_match values(4,2,10,1,4,1);
insert into player_match values(4,2,11,1,3,2);
insert into player_match values(4,2,12,0,3,4);

insert into player_match values(4,3,13,2,3,4);
insert into player_match values(4,3,14,1,5,4);
insert into player_match values(4,3,15,4,10,6);
insert into player_match values(4,3,16,1,8,2);
insert into player_match values(4,3,17,0,5,5);
insert into player_match values(4,3,18,3,6,6);


insert into player_match values(5,2,7,0,13,3);
insert into player_match values(5,2,8,1,4,8);
insert into player_match values(5,2,9,5,5,6);
insert into player_match values(5,2,10,4,15,4);
insert into player_match values(5,2,11,3,12,10);
insert into player_match values(5,2,12,2,5,8);


insert into player_match values(5,4,19,1,13,3);
insert into player_match values(5,4,20,2,4,8);
insert into player_match values(5,4,21,5,5,6);
insert into player_match values(5,4,22,5,15,4);
insert into player_match values(5,4,23,3,13,11);
insert into player_match values(5,4,24,2,5,8);


insert into player_match values(6,3,13,2,15,5);
insert into player_match values(6,3,14,1,10,4);
insert into player_match values(6,3,15,4,14,2);
insert into player_match values(6,3,16,3,5,2);
insert into player_match values(6,3,17,0,9,3);
insert into player_match values(6,3,18,0,1,5);

insert into player_match values(6,4,19,4,12,3);
insert into player_match values(6,4,20,0,3,6);
insert into player_match values(6,4,21,0,5,10);
insert into player_match values(6,4,22,2,5,8);
insert into player_match values(6,4,23,3,5,6);
insert into player_match values(6,4,24,4,17,3);








