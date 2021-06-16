# project2

## Extract:
Our original data sources were .csv files downloaded from a few datasets on Kaggle.com and one from investing.com.

## Transform: 
We loaded in our files, converted them to DataFrames, and began to clean up the files. We knew our tables would join on the Date fields most efficiently so we made sure to normalize those fields across our data.

#### Games Tables

#### Bitcoin Data and Features Table
Wanted to add in the average Bitcoin price to the Features Table that also held market information—like temp, fuel price, unemployement and the CPI to compare to sales data. Took the Bitcoin data and turned it into a DataFrame, used to_datetime to convert the date column for yyyy-mm-dd format (did same for the date in Features and Sales Dataframes). Dropped columns I didn't need, and created a new column with the rolling 7-day average for Bitcoin. Then I could merge this with the Features Table to create a Bitcoin column that would match up with the weekly dates.

#### Holiday and Sales Table
Found a csv from kaggle that featured some fun unofficial holidays. Decided to load that data and incorporate with our sales data. Firstly, I read the csv file as a dataframe and added 2011 to each value within the date column to match our sales data year. I then wanted to change the date column of the holidays database to match the sales data format. I ran into errors when trying to use a for loop and began dropping rows that had incomplete values and values that were not compatible with the method I wanted to use to format them. Finally, I was able to format the date column of the holidays dataframe to match our sales data dataframe. I then renamed columns and dropped unneeded ones. 

Because we are only looking at 2011 sales data, I created a new dataframe only of 2011 dates from the sales dataframe. I then dropped unneeded columns and merged sales with unnofficial holiday. Further transformed my resulting dataframe by renaming columns. 

#### Store Table
Created a DataFrame.

## Load: 
We had created an initial schema for our SQL database before we started, and once we had transformed our data we confirmed everything matched up and created the tables in SQL and loaded in our data. We joined the tables to show they would be able to be queried effectively. 
