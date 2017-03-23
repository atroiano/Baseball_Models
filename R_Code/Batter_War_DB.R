
#Inital Code from https://github.com/keberwein/Data_Science_Riot/blob/master/Lahman_WAR/Lahman_War_batting.R and modified to work correctly
require(DBI)
require(RMySQL)
require(tidyverse)
require(data.table)
if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "http://www.baseball-reference.com/data/war_daily_bat.txt"
download.file(fileUrl, destfile="war_daily_bat.csv", method="curl")

# Write the download to a data frame
df <- read.csv("war_daily_bat.csv", header=TRUE, stringsAsFactors=FALSE)

con <- dbConnect(MySQL(), user='root', password='andrew', dbname='Baseball', host='127.0.0.1')
master <- dbSendQuery(con, "SELECT playerID as player_ID, bbrefID, retroid FROM Baseball.master")
m <- fetch(master, n = -1)
dbClearResult(dbListResults(con)[[1]])

teams <- dbSendQuery(con, "SELECT year_ID, team_ID from baseball.teams")
t <- fetch(teams, n = -1)

#Join master and war data frames
df2 <- left_join(df, m, by = c("player_ID"))

# Convert and rename a few things in the teams dataframe to make the join smooth
#t$teamID <- as.factor(t$team_ID)

#Now we index the teams
df3 <- left_join(df2, t)

#Reorder data frame
final <- subset(df3, select = c(player_ID,bbrefID, retroid, year_ID, age, team_ID, stint_ID, lg_ID, PA, G, 
                                Inn, runs_bat, runs_br, runs_dp, runs_field, runs_infield, 
                                runs_outfield, runs_catcher, runs_good_plays, runs_defense, 
                                runs_position, runs_position_p, runs_replacement, runs_above_rep, 
                                runs_above_avg, runs_above_avg_off, runs_above_avg_def, WAA, WAA_off, 
                                WAA_def, WAR, WAR_def, WAR_off, WAR_rep, salary, pitcher, teamRpG, 
                                oppRpG, oppRpPA_rep, oppRpG_rep, pyth_exponent, pyth_exponent_rep, 
                                waa_win_perc, waa_win_perc_off, waa_win_perc_def, waa_win_perc_rep)) 

#Rename a couple of columns in our new tidy data set to fit to Lahman standards
names(final)[names(final)=="stint_ID"] <- "stint"
names(final)[names(final)=="lg_ID"] <- "lgID"
names(final)[names(final)=="year_ID"] <- "yearID"
names(final)[names(final)=="team_ID"] <- "teamID"

# Clean up the data types before loading into Lahman
# This part is nausiating but necessary...
final$age <- as.integer(as.character(final$age))
final$stint <- as.integer(as.character(final$stint))
final$PA <- as.integer(as.character(final$PA))
final$G <- as.integer(as.character(final$G))
final$Inn <- as.integer(as.character(final$Inn))
final$runs_bat <- as.double(as.character(final$runs_bat))
final$runs_br <- as.double(as.character(final$runs_br))
final$runs_dp <- as.double(as.character(final$runs_dp))
final$runs_field <- as.double(as.character(final$runs_field))
final$runs_infield <- as.double(as.character(final$runs_infield))
final$runs_outfield <- as.double(as.character(final$runs_outfield))
final$runs_catcher <- as.double(as.character(final$runs_catcher))
final$runs_good_plays <- as.double(as.character(final$runs_good_plays))
final$runs_position <- as.double(as.character(final$runs_position))
final$replacement <- as.double(as.character(final$replacement))
final$runs_above_rep <- as.double(as.character(final$runs_above_rep))
final$runs_above_avg <- as.double(as.character(final$runs_above_avg))
final$runs_above_avg_off <- as.double(as.character(final$runs_above_avg_off))
final$runs_above_avg_def <- as.double(as.character(final$runs_above_avg_def))
final$WAA <- as.double(as.character(final$WAA))
final$WAA_off <- as.double(as.character(final$WAA_off))
final$WAA_def <- as.double(as.character(final$WAA_def))
final$WAR <- as.double(as.character(final$WAR))
final$WAR_def <- as.double(as.character(final$WAR_def))
final$WAR_off <- as.double(as.character(final$WAR_off))
final$WAR_rep <- as.double(as.character(final$WAR_rep))
final$salary <- as.integer(as.character(final$salary))
final$teamrRpG <- as.double(as.character(final$teamRpG))
final$oppRpG <- as.double(as.character(final$oppRpG))
final$oppRpPA_rep <- as.double(as.character(final$oppRpPA_rep))
final$oppRpG_rep <- as.double(as.character(final$oppRpG_rep))
final$pyth_exponent <- as.double(as.character(final$pyth_exponent))
final$pyth_exponent_rep <- as.double(as.character(final$pyth_exponent_rep))
final$waa_win_perc <- as.double(as.character(final$waa_win_perc))
final$waa_win_perc_off <- as.double(as.character(final$waa_win_perc_off))
final$waa_win_perc_def <- as.double(as.character(final$waa_win_perc_def))
final$waa_win_perc_rep <- as.double(as.character(final$waa_win_perc_rep))


dbWriteTable(con, name='war_batting', value=final, row.names = FALSE, overwrite = TRUE)

#close all connections
all_cons <- dbListConnections(MySQL())
for(con in all_cons) 
  dbDisconnect(con)
