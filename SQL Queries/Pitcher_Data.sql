SELECT 
Pit_ID
,case when BAT_HOME_ID = 1 then AWAY_TEAM_ID else HOME_TEAM_ID end as Team
,sum(PA_BALL_CT+PA_CALLED_STRIKE_CT+PA_SWINGMISS_STRIKE_CT+PA_FOUL_STRIKE_CT+PA_INPLAY_STRIKE_CT+PA_OTHER_STRIKE_CT) as TotalPitches
,sum(EVENT_OUTS_CT)/3 as InningsPitched
,count(bat_id) as BattersFaced
,PIT_START_FL
,PIT_HAND_CD
,substring( game_id, 4, 8 ) as date  
FROM baseball.events 
where HOME_TEAM_ID = 'PHI' 
and cast(substring( game_id, 4, 8 ) as date)  >=  01-01-2015
and game_id = 'PHI201004120'
group by 
substring( game_id, 4, 8 ) 
,HOME_TEAM_ID
,AWAY_TEAM_ID
,Pit_ID
,case when BAT_HOME_ID = 1 then AWAY_TEAM_ID else HOME_TEAM_ID end 
,PIT_START_FL
,PIT_HAND_CD