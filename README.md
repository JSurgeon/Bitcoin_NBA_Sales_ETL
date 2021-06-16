# project2

## Extract:
Our original data sources were .csv files downloaded from a few datasets on Kaggle.com and one from investing.com.

## Transform: 
We loaded in our files, converted them to DataFrames, and began to clean up the files.
We knew our tables would join on the Date fields most efficiently so we converted those fields to a consistent format. We dropped columns that were not neccessary, and rows we didn't need. 

## Load: 
We had created an initial schema for our SQL database before we started, and once we had transformed our data we confirmed everything matched up and created the tables in SQL and loaded in our data. We joined the tables to show they would be able to be queried effectively. 
