# GettingCleaningData-Assignment
Script for the assignment of coursera Getting and Cleaning Data course

This script generate several tidy datasets based on data of the zip file.
* testData and trainData with the test and train data independently.
* totalDF with all the data merged
* filteredTotalDF with the mean() and std() variables only
* SubjectDFSum with the average of each variable for each activity and each subject. The contents of this file are stored in result.txt when the script is run.



# Raw data
The raw data was obtained from this address
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
##files:
* train/X_train.txt: raw train data
* test/X_test.txt: raw test data
* test/subject_test.txt: subjects test ids 
* train/subject_train.txt: subjects train id
* train/y_train.txt: train activity ids
* test/y_test.txt: test activity ids
* features.txt: names for the data columns for the X_train and X_test files
* activity_labels.txt: names for the activity ids
