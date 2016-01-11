
create database dbproject;
use dbproject;

create table team(
		    id int primary key auto_increment,
                    name varchar(255) unique,
                    won_matches int default 0,
                    lost_matches int default 0,
                    score int default 0,
                    won_sets int default 0,
                    lost_sets int default 0,
                    set_ratio float default 0.0,
                    won_points int default 0,
                    lost_points int default 0,
                    point_ratio float default 0.0

                    ) DEFAULT CHARACTER SET=utf8;


create table player(
		    id int primary key auto_increment,
                    name varchar(255),
                    team_id int,
                    is_captain boolean,
                    birth_date date,
                    age int default 0,
                    foreign key (team_id) references team(id)
                    ) DEFAULT CHARACTER SET=utf8;


create table referee(
		     id int primary key auto_increment,
		     name varchar(255),
		     match_num int default 0
		     ) DEFAULT CHARACTER SET=utf8;


create table stadium(
	             id int primary key auto_increment,
	             name varchar(255)
	             ) DEFAULT CHARACTER SET=utf8;


create table mmatch(id int primary key auto_increment,
                    date date DEFAULT 0,
                    time time DEFAULT 0,
                    duration time DEFAULT 0,
                    team1_id int,
                    team2_id int,
                    team1_score int default 0,
                    team2_score int default 0,
                    stadium_id int default 1,
                    first_referee_id int default 1,
                    foreign key (team1_id) references team(id),
                    foreign key (team2_id) references team(id),
                    foreign key (stadium_id) references stadium(id),
                    foreign key (first_referee_id) references referee(id)
                    ) DEFAULT CHARACTER SET=utf8;



create table referee_match(
                    match_id int,
                    referee_id int,
                    foreign key (match_id) references mmatch(id),
                    foreign key (referee_id) references referee(id),
                    primary key (match_id,referee_id)
                    ) DEFAULT CHARACTER SET=utf8;

create table sset(
                    match_id int,
                    set_num int,
                    team1_points int,
                    team2_points int,
                    foreign key (match_id) references mmatch(id),
                    primary key (match_id,set_num)
                    
                ) DEFAULT CHARACTER SET=utf8;

create table player_match(

                    match_id int,
                    team_id int,
                    player_id int,
                    
                    serve_num int,
                    attack_num int,
                    block_num int,
                    
                    foreign key (team_id) references team(id),
                    foreign key (player_id) references player(id),
                    foreign key (match_id) references mmatch(id),
                    primary key (match_id,team_id,player_id)
                    
                ) DEFAULT CHARACTER SET=utf8;





