#Inital Code from https://github.com/keberwein/Data_Science_Riot/blob/master/Lahman_WAR/Lahman_War_batting.R and modified to work correctly
#Load packages and install if you don't have them
require(DBI)
require(RMySQL)
require(dplyr)

if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "http://www.baseball-reference.com/data/war_daily_pitch.txt"
download.file(fileUrl, destfile="war_daily_pitch.csv", method="curl")

df <- read.csv("war_daily_pitch.csv", header=TRUE)
con <- dbConnect(MySQL(), user='root', password='andrew', dbname='Baseball', host='127.0.0.1')

#SQL the database for playerid on the master table "bbrefid" are the Baseball Reference ids
master <- dbSendQuery(con, "SELECT playerID as player_ID, bbrefID, retroid FROM Baseball.Master")
m <- fetch(master, n = -1)
dbClearResult(dbListResults(con)[[1]])

#SQL on the teams table to match Baseball Ref team_ID
teams <- dbSendQuery(con, "SELECT year_id as year_ID, team_id as team_ID FROM Baseball.teams")
t <- fetch(teams, n = -1)

df2 <- left_join(df, m, by = c("player_ID"))

names(t)[names(t)=="teamIDBR"] <- "team_ID"

df3 <- left_join(df2, t)

#Reorder data frame
final <- subset(df3, select = c(player_ID, bbrefID, retroid,  year_ID, age, team_ID,  stint_ID, lg_ID, G, GS, IPouts, IPouts_start, 
                                IPouts_relief, RA, xRA, xRA_sprp_adj, xRA_def_pitcher, PPF, PPF_custom, xRA_final, 
                                BIP, BIP_perc, RS_def_total, runs_above_avg, runs_above_avg_adj, runs_above_rep, 
                                RpO_replacement, GR_leverage_index_avg, WAR, salary, teamRpG, oppRpG, pyth_exponent, 
                                waa_win_perc, WAA, WAA_adj, oppRpG_rep, pyth_exponent_rep, waa_win_perc_rep, WAR_rep))

#Rename a couple of columns in our new tidy data set to fit to Lahman standards
names(final)[names(final)=="stint_ID"] <- "stint"
names(final)[names(final)=="lg_ID"] <- "lgID"
names(final)[names(final)=="year_ID"] <- "yearID"
names(final)[names(final)=="team_ID"] <- "teamID"

# Clean up the data types before loading into Lahman
# This part is nausiating but necessary...
final$age <- as.integer(as.character(final$age))
final$stint <- as.integer(as.character(final$stint))
final$G <- as.integer(as.character(final$G))
final$GS <- as.integer(as.character(final$GS))
final$IPouts <- as.integer(as.character(final$IPouts))
final$salary <- as.integer(as.character(final$salary))
final$IPouts_start <- as.integer(as.character(final$IPouts_start))
final$IPouts_relief <- as.integer(as.character(final$IPouts_relief))
final$RA <- as.integer(as.character(final$RA))
final$xRA_sprp_adj <- as.double(as.character(final$xRA_sprp_adj))
final$xRA_def_pitcher <- as.double(as.character(final$xRA_def_pitcher))
final$PPF <- as.integer(as.character(final$PPF))
final$PPF_custom <- as.double(as.character(final$PPF_custom))
final$xRA_final <- as.double(as.character(final$xRA_final))
final$BIP <- as.integer(as.character(final$BIP))
final$BIP_perc <- as.integer(as.character(final$BIP_perc))
final$RS_def_total <- as.double(as.character(final$RS_def_total))
final$runs_above_avg <- as.double(as.character(final$runs_above_avg))
final$runs_above_avg_adj <- as.double(as.character(final$runs_above_avg_adj))
final$runs_above_rep <- as.double(as.character(final$runs_above_rep))
final$RpO_replacement <- as.double(as.character(final$RpO_replacement))
final$GR_leverage_index_avg <- as.double(as.character(final$GR_leverage_index_avg))
final$WAR <- as.double(as.character(final$WAR))
final$oppRpG <- as.double(as.character(final$oppRpG))
final$pyth_exponent <- as.double(as.character(final$pyth_exponent))
final$waa_win_perc <- as.double(as.character(final$waa_win_perc))
final$WAA <- as.double(as.character(final$WAA))
final$WAA_adj <- as.double(as.character(final$WAA_adj))
final$oppRpG_rep <- as.double(as.character(final$oppRpG_rep))
final$pyth_exponent_rep <- as.double(as.character(final$pyth_exponent_rep))
final$waa_win_perc_rep <- as.double(as.character(final$waa_win_perc_rep))
final$WAR_rep <- as.double(as.character(final$WAR_rep))

dbWriteTable(con, name='war_pitching', value=final, row.names = FALSE, overwrite = TRUE)

all_cons <- dbListConnections(MySQL())
for(con in all_cons) 
  dbDisconnect(con)
