GCDAnalysis
===========

Peer Assessments repository for "Getting and Cleaning Data" of "Data Science"

First unzip the data zip files https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip in the working directory. A folder "UCI HAR Dataset" will be created in the working directory.

1.- Check that all the following files are in YOUR working directory

X_test.txt test y_test.txt test_label subject_test.txt test_subject X_train.txt train y_train.txt train_label subject_train.txt train_subject activity_labels.txt activity features.txt features

2.- Execute run_analysis.R

3.- It will produce the file "tidy.txt"

Following more details:
This is the script which is used for doing the following steps as required by the assignment. Each of these step numbers are marked in the appropriate code areas. Brief description how this is accomplished is given below.

Merges the training and the test sets to create one data set. Load train & test files of X,Y,subject text files use cbind to merge X,Y,subject train files use cbind to merge X,Y,sibject test files use rbind to make all these single big file - called all_data 

Extracts only the measurements on the mean and standard deviation for each measurement. 

Uses descriptive activity names to name the activities in the data set

Appropriately labels the data set with descriptive activity names.

Creates the tidy data set with the average of each variable for each activity and each subject.

Write the results to a file tidy.txt
