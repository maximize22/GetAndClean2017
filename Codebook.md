Codebook describing the data modifications to the UCI HAR dataset  

Assumes that files have already been downloaded to a working directory.  
Files can be accessed at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  

1. Individual files are loaded into memory  
2. Slashes are removed from each data set  
3. x.test and x.train dataset names are replaced with the values from the features.txt file V2 column  
4. Subject, x, and y train and test datasets are merged together  
5. Activity descriptions are added to the Y data set  
6. Column names for subject data ('subject id') and y data ('activity id') are updated to be descriptive  
7. Redundant column is removed from the Y data set  
8. Column names with 'mean' and 'std' are extracted into temporary lists and merged; new data set is extracted with just those columns  
9. Tidy set created by combining Subject, Activity, and Mean/Std data  
10. Tidy data set is melted, grouped, and summarized to produce the average of each variable for each subject  
11. Final data set is exported to a text file with write.table command  

