SELECT 
g.GAME_ID
,g.Game_DY
,g.DAYNIGHT_PARK_CD
,g.AWay_team_id
,g.HOME_TEAM_ID
,g.Park_ID
,g.Temp_Park_CT
,g.WIND_DIRECTION_PARK_CD
,wd.SHORTNAME_TX 
,g.Wind_speed_park_ct
,g.field_park_cd 
,g.sky_park_cd
,g.MINUTES_GAME_CT
,g.AWAY_SCORE_CT
,g.home_score_ct
,g.AWAY_HITS_CT
,g.HOME_HITS_CT
,g.Home_err_Ct
,g.away_lob_ct
,g.home_lob_ct
,case when g.save_pit_id is not null then 'yes' else 'no' end as SavedGame
FROM baseball.games g
left join baseball.lkup_cd_park_wind_direction wd on wd.VALUE_CD = g.WIND_DIRECTION_PARK_CD
WHERE HOME_TEAM_ID = 'PHI'
Order by GAME_ID