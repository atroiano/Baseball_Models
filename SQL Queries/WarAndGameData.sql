Select  
 g.GAME_id as gameID
 ,year(cast(substring( game_id, 4, 8) as date)) as gameDate
 ,awb1.WAR
FROM baseball.games g
left join baseball.master mstr on mstr.retroid = g.AWAY_LINEUP1_BAT_ID
left join baseball.war_batting awb1 on wb.player_ID = mstr.playerid and wb.yearID = year(cast(substring( game_id, 4, 8) as date))
where  HOME_TEAM_ID = 'PHI'war_batting