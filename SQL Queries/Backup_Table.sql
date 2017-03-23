CREATE TABLE baseball.war_pitching_backup LIKE baseball.war_pitching;
insert into baseball.war_pitching_backup
Select 
*
From baseball.war_pitching