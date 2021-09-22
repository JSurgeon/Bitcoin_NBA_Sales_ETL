# Bitcoin_Sales_NBA_ETL

## Extract:
Our original data sources were .csv files downloaded from a few datasets on Kaggle.com and one from investing.com.

## Transform: 
We loaded in our files, converted them to DataFrames, and began to clean up the files. We knew our tables would join on the Date fields most efficiently so we made sure to normalize those fields across our data.

#### Games Tables
We weren't interested in anything but the days the game were played on, any information about the history of a team, nor any information about the head coach, owner, general manager, etc. So, we had to drop all columns from the teams dataframe besides Team ID, Nickname, and City. It further seemed easier to concatenate nickname and city, so we transformed those columns into one on the teams dataframe- after this was done we could safely drop the nickname and city, since they now existed together in one column "team_name".

For the games dataframe, we again had to drop columns that we weren't interested in. This required a single drop statement with a list of all the columns we wanted to remove: game_status, season #, and all information about the performance of the team (we simply wanted what days games were played on, the game id, and who played in the games. Thus, GAME_DATE_EST, GAME_ID, HOME_TEAM_ID, AND VISITOR_TEAM_ID were left in the table. We needed team_ids to eventually join this games dataframe with the teams dataframe.

We only wanted one dataframe/table for the NBA games, so we had to merge the games and teams dataframe as mentioned previously. Doing so required two steps: 1) merging the two dataframe on home_team_id while making sure to label the new frames that came in as "home_team_name" and then 2) merging again, this time on visitor_team_id making sure to label appropriately. This couldn't be completed in one merge because of the nature of basketball games- i.e., the team_ids from the teams dataframe existed twice in the games dataframe- once for the home team and once for the away team. These merges created an extra column for team_id_x and y, so those needed dropped once the merges were complete.

Last steps were to rename the columns to match our SQL schema, turn the dates into a datetime object (they were strings). And finally, we decided we only cared about Portland Trailblazer games in 2011, so two ilocs were performed to grab first the home games they played and then the away games played and a simple comparison of the date (i.e., ==2011) to narrow the results.

#### Bitcoin Data and Features Table
Wanted to add in the average Bitcoin price to the Features Table that also held market information—like temp, fuel price, unemployement and the CPI to compare to sales data. Took the Bitcoin data and turned it into a DataFrame, used to_datetime to convert the date column for yyyy-mm-dd format (did same for the date in Features and Sales Dataframes). Dropped columns I didn't need, and created a new column with the rolling 7-day average for Bitcoin. Then I could merge this with the Features Table to create a Bitcoin column that would match up with the weekly dates.

We didn't need the extra columns in the features table so I dropped them from the table and renamed the remaining columns with more obvious headers and matched them to the table schema we created. I then created a new column with the number of the week of the year by pulling it from the date column of our features table. We wanted to show both farenheit and celsius so I created a new column by converting the temperature column to celsius and then rounding the number. I then reordered the columns to fit the table schema we created.

#### Holiday and Sales Table
Found a csv from kaggle that featured some fun unofficial holidays. Decided to load that data and incorporate with our sales data. Firstly, I read the csv file as a dataframe and added 2011 to each value within the date column to match our sales data year. I then wanted to change the date column of the holidays database to match the sales data format. I ran into errors when trying to use a for loop and began dropping rows that had incomplete values and values that were not compatible with the method I wanted to use to format them. Finally, I was able to format the date column of the holidays dataframe to match our sales data dataframe. I then renamed columns and dropped unneeded ones. 

Because we are only looking at 2011 sales data, I created a new dataframe only of 2011 dates from the sales dataframe. I then dropped unneeded columns and merged sales with unnofficial holiday. Further transformed my resulting dataframe by renaming columns. 

#### Store Table
Created a DataFrame.

## Load: 
We had created an initial schema for our SQL database before we started, and once we had transformed our data we confirmed everything matched up and created the tables in SQL and loaded in our data. We joined the tables to show they would be able to be queried effectively. 
