Select  
g.GAME_id as gameID
,year(cast(substring( game_id, 4, 8) as date)) as gameDate
,sum(awb1.WAR) as batterOneWar
,sum(awb2.WAR) as batterTwoWar
,sum(awb3.WAR) as batterThreeWar
,sum(awb4.WAR) as batterFourWar
,sum(awb5.WAR) as batterFiveWar
,sum(awb6.WAR) as batterSixWar
,sum(awb7.WAR) as batterSevenWar
,sum(awb8.WAR) as batterEightWar
,sum(awb9.WAR) as batterNineWar
FROM baseball.games g
left join baseball.war_batting awb1 on awb1.retroid = g.AWAY_LINEUP1_BAT_ID and awb1.yearid = year(cast(substring( game_id, 4, 8) as date))
left join baseball.war_batting awb2 on awb2.retroid = g.AWAY_LINEUP2_BAT_ID and awb2.yearid = year(cast(substring( game_id, 4, 8) as date))
left join baseball.war_batting awb3 on awb3.retroid = g.AWAY_LINEUP3_BAT_ID and awb3.yearid = year(cast(substring( game_id, 4, 8) as date))
left join baseball.war_batting awb4 on awb4.retroid = g.AWAY_LINEUP4_BAT_ID and awb4.yearid = year(cast(substring( game_id, 4, 8) as date))
left join baseball.war_batting awb5 on awb5.retroid = g.AWAY_LINEUP5_BAT_ID and awb5.yearid = year(cast(substring( game_id, 4, 8) as date))
left join baseball.war_batting awb6 on awb6.retroid = g.AWAY_LINEUP6_BAT_ID and awb6.yearid = year(cast(substring( game_id, 4, 8) as date))
left join baseball.war_batting awb7 on awb7.retroid = g.AWAY_LINEUP7_BAT_ID and awb7.yearid = year(cast(substring( game_id, 4, 8) as date))
left join baseball.war_batting awb8 on awb8.retroid = g.AWAY_LINEUP8_BAT_ID and awb8.yearid = year(cast(substring( game_id, 4, 8) as date))
left join baseball.war_batting awb9 on awb9.retroid = g.AWAY_LINEUP9_BAT_ID and awb9.yearid = year(cast(substring( game_id, 4, 8) as date))
where  HOME_TEAM_ID = 'PHI' and  year(cast(substring( game_id, 4, 8) as date)) >=2012
group by
g.GAME_id
,year(cast(substring( game_id, 4, 8) as date))