# GetAndClean2017
Coursera Getting and Cleaning Data 2017

* Course Project Instructions  

Description of Original Data  
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:  
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

You should create one R script called run_analysis.R that does the following.

1.Merges the training and the test sets to create one data set.  
2.Extracts only the measurements on the mean and standard deviation for each measurement.  
3.Uses descriptive activity names to name the activities in the data set  
4.Appropriately labels the data set with descriptive variable names.  
5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


* Files included 

run_analysis.R - source code that loads, processes, and generates output file  
LCoutput.txt - output file with tidy data set  
readme.md - this file with general infomration about the repository/project
codebook.md - the codebook with the plain instructions/descriptions of how the data was loaded/processed/output
features_info.txt - the associated file with the descriptions of each activity including units of measure

* Description

data modifications to the UCI HAR dataset

Assumes that files have already been downloaded to a working directory.
Files can be accessed at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Individual files are loaded into memory
Slashes are removed from each data set
x.test and x.train dataset names are replaced with the values from the features.txt file V2 column
Subject, x, and y train and test datasets are merged together
Activity descriptions are added to the Y data set
Column names for subject data ('subject id') and y data ('activity id') are updated to be descriptive
Redundant column is removed from the Y data set
Column names with 'mean' and 'std' are extracted into temporary lists and merged; new data set is extracted with just those columns
Tidy set created by combining Subject, Activity, and Mean/Std data
Tidy data set is melted, grouped, and summarized to produce the average of each variable for each subject
Final data set is exported to a text file with write.table command
