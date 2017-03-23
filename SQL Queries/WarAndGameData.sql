Select  
g.GAME_id as gameID
,year(cast(substring( game_id, 4, 8) as date)) as gameDate
,sum(awb1.WAR) as batterOneWarAway
,sum(awb2.WAR) as batterTwoWarAway
,sum(awb3.WAR) as batterThreeWarAway
,sum(awb4.WAR) as batterFourWarAway
,sum(awb5.WAR) as batterFiveWarAway
,sum(awb6.WAR) as batterSixWarAway
,sum(awb7.WAR) as batterSevenWarAway
,sum(awb8.WAR) as batterEightWarAway
,sum(awb9.WAR) as batterNineWarAway
,sum(hwb1.WAR) as batterOneWarHome
,sum(hwb2.WAR) as batterTwoWarHome
,sum(hwb3.WAR) as batterThreeWarHome
,sum(hwb4.WAR) as batterFourWarHome
,sum(hwb5.WAR) as batterFiveWarHome
,sum(hwb6.WAR) as batterSixWarHome
,sum(hwb7.WAR) as batterSevenWarHome
,sum(hwb8.WAR) as batterEightWarHome
,sum(hwb9.WAR) as batterNineWarHome
,case when home_score_ct > away_score_ct then 'Home' else 'Away' end as winningTeam
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
left join baseball.war_batting hwb1 on hwb1.retroid = g.HOME_LINEUP1_BAT_ID and hwb1.yearid = year(cast(substring( game_id, 4, 8) as date))
left join baseball.war_batting hwb2 on hwb2.retroid = g.HOME_LINEUP2_BAT_ID and hwb2.yearid = year(cast(substring( game_id, 4, 8) as date))
left join baseball.war_batting hwb3 on hwb3.retroid = g.HOME_LINEUP3_BAT_ID and hwb3.yearid = year(cast(substring( game_id, 4, 8) as date))
left join baseball.war_batting hwb4 on hwb4.retroid = g.HOME_LINEUP4_BAT_ID and hwb4.yearid = year(cast(substring( game_id, 4, 8) as date))
left join baseball.war_batting hwb5 on hwb5.retroid = g.HOME_LINEUP5_BAT_ID and hwb5.yearid = year(cast(substring( game_id, 4, 8) as date))
left join baseball.war_batting hwb6 on hwb6.retroid = g.HOME_LINEUP6_BAT_ID and hwb6.yearid = year(cast(substring( game_id, 4, 8) as date))
left join baseball.war_batting hwb7 on hwb7.retroid = g.HOME_LINEUP7_BAT_ID and hwb7.yearid = year(cast(substring( game_id, 4, 8) as date))
left join baseball.war_batting hwb8 on hwb8.retroid = g.HOME_LINEUP8_BAT_ID and hwb8.yearid = year(cast(substring( game_id, 4, 8) as date))
left join baseball.war_batting hwb9 on hwb9.retroid = g.HOME_LINEUP9_BAT_ID and hwb9.yearid = year(cast(substring( game_id, 4, 8) as date))
where  HOME_TEAM_ID = 'PHI' and  year(cast(substring( game_id, 4, 8) as date)) >=2012
group by
g.GAME_id
,year(cast(substring( game_id, 4, 8) as date))