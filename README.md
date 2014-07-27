GettingCleaningDataProject
==========================

Getting and Cleaning Data Course Project / From Coursera

In this project data set from 'Human Activity Recognition Using Smartphones' is used which can be found in the following link:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The steps performed in the script follows the required steps in the Getting and Cleaning course project from Coursera

The data has three parts: subject, activity, and measurements which could be found in a different files. There are two types of data, train and test which are saved separately.

Following actions is performed:

- The data is read for each part and for each type in a separate R object
- Train and test data are merged for each part
- According to the measurements' names we extract mean and standard deviation readings and save them in a subset of data
- Read activity names and assign them to each activity
- Make measurement names more meaningful and clear by some manipulations to the name strings
- Mereg three data types (subject, activity, and measurements) into one data frame
- Summerize merged data by performing aggregate function on 'Subject' & 'Activity' columns and the mean of the measurements
- Save final data into a text file


