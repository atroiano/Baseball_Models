Drop Table Baseball.FlatLineup
Create TABLE Baseball.FlatLineup (GAME_ID varchar(12), year varchar(4), Batter_ID varchar(8), TeamPos varchar(25))

Insert Into Baseball.FlatLineup
Select 
GAME_id
,year(cast(substring( game_id, 4, 8) as date)) as year
,AWAY_LINEUP1_BAT_ID
,'AwayBatterOne' as Batter
from Baseball.games

UNION ALL
Select 
GAME_id
,year(cast(substring( game_id, 4, 8) as date)) as year
,AWAY_LINEUP2_BAT_ID
,'AwayBatterTwo' as Batter
from Baseball.games

UNION ALL
Select 
GAME_id
,year(cast(substring( game_id, 4, 8) as date)) as year
,AWAY_LINEUP3_BAT_ID
,'AwayBatterThree' as Batter
from Baseball.games


UNION ALL
Select 
GAME_id
,year(cast(substring( game_id, 4, 8) as date)) as year
,AWAY_LINEUP4_BAT_ID
,'AwayBatterFour' as Batter
from Baseball.games


UNION ALL
Select 
GAME_id
,year(cast(substring( game_id, 4, 8) as date)) as year
,AWAY_LINEUP5_BAT_ID
,'AwayBatterFive' as Batter
from Baseball.games

UNION ALL
Select 
GAME_id
,year(cast(substring( game_id, 4, 8) as date)) as year
,AWAY_LINEUP6_BAT_ID
,'AwayBatterSix' as Batter
from Baseball.games

UNION ALL
Select 
GAME_id
,year(cast(substring( game_id, 4, 8) as date)) as year
,AWAY_LINEUP7_BAT_ID
,'AwayBatterSeven' as Batter
from Baseball.games

UNION ALL
Select 
GAME_id
,year(cast(substring( game_id, 4, 8) as date)) as year
,AWAY_LINEUP8_BAT_ID
,'AwayBatterEight' as Batter
from Baseball.games

UNION ALL
Select 
GAME_id
,year(cast(substring( game_id, 4, 8) as date)) as year
,AWAY_LINEUP9_BAT_ID
,'AwayBatterNine' as Batter
from Baseball.games

UNION ALL
Select 
GAME_id
,year(cast(substring( game_id, 4, 8) as date)) as year
,HOME_LINEUP1_BAT_ID
,'HomeBatterOne' as Batter
from Baseball.games

UNION ALL
Select 
GAME_id
,year(cast(substring( game_id, 4, 8) as date)) as year
,HOME_LINEUP2_BAT_ID
,'HomeBatterTwo' as Batter
from Baseball.games


UNION ALL
Select 
GAME_id
,year(cast(substring( game_id, 4, 8) as date)) as year
,HOME_LINEUP3_BAT_ID
,'HomeBatterThree' as Batter
from Baseball.games

UNION ALL
Select 
GAME_id
,year(cast(substring( game_id, 4, 8) as date)) as year
,HOME_LINEUP4_BAT_ID
,'HomeBatterFour' as Batter
from Baseball.games

UNION ALL
Select 
GAME_id
,year(cast(substring( game_id, 4, 8) as date)) as year
,HOME_LINEUP5_BAT_ID
,'HomeBatterFive' as Batter
from Baseball.games

UNION ALL
Select 
GAME_id
,year(cast(substring( game_id, 4, 8) as date)) as year
,HOME_LINEUP6_BAT_ID
,'HomeBatterSix' as Batter
from Baseball.games

UNION ALL
Select 
GAME_id
,year(cast(substring( game_id, 4, 8) as date)) as year
,HOME_LINEUP7_BAT_ID
,'HomeBatterSeven' as Batter
from Baseball.games

UNION ALL
Select 
GAME_id
,year(cast(substring( game_id, 4, 8) as date)) as year
,HOME_LINEUP8_BAT_ID
,'HomeBatterEight' as Batter
from Baseball.games
UNION ALL
Select 
GAME_id
,year(cast(substring( game_id, 4, 8) as date)) as year
,HOME_LINEUP9_BAT_ID
,'HomeBatterNine' as Batter
from Baseball.games

