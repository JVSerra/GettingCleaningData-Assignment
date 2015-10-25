# GettingCleaningData-Assignment
Script for the assignment of coursera Getting and Cleaning Data course

This script generate several tidy datasets based on data of the zip file.
* testData and trainData with the test and train data independently.
* totalDF with all the data merged
* filteredTotalDF with the mean() and std() variables only
* SubjectDFSum with the average of each variable for each activity and each subject. The contents of this file are stored in result.txt when the script is run.

# Raw data

The raw data was obtained from this address:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Description of the dataset:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

##files:
* train/X_train.txt: raw train data
* test/X_test.txt: raw test data
* test/subject_test.txt: subjects test ids 
* train/subject_train.txt: subjects train id
* train/y_train.txt: train activity ids
* test/y_test.txt: test activity ids
* features.txt: names for the data columns for the X_train and X_test files
* activity_labels.txt: names for the activity ids

# Steps
Load dplyr library

Read data using read.table(****, header = FALSE)

Create two different data frames one for test and another for train

Read features names

Read the file with the activity labels

Apply features.txt names to columns

Add subjects column

Create Activity columns as a factor vector based on the activity labels

Then merge the two datasets with rbind

find the index for the columns to select with grep 

Filter the data frame with those index

Create a tidy data set with the average of each variable for each activity and each subject. For this group_by(filteredTotalDF,Activity, Subject) function was used.

Then the data frame was summarized and the mean function was applied to each variable with summarise_each(funs(mean))


