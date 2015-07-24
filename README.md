# Course3Project
Course 3 Project Assignment
Getting and Cleaning Data

## Introduction
This repository is a requirement for Project Assignment of Course 3 (Getting and Cleaning Data).

The repository consists of:
- Readme.md (this file = gives the introduction and explanation)
- CodeBook.md (this is the code book that describes the variables, the data, and any transformations or work that was performed to clean up the data 
- run_analysis.R  (the R script that does the steps required)

## The Requirement
The requirement of the project is to write an R script (run_analysis.R) to read some data given from a link to a website 
   https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

This is the data collected from the accelerometers from the Samsung Galaxy S smartphone.

The data is then unzipped, read into R, and does the following:
- Merges the training and the test sets to create one data set.
- Extracts only the measurements on the mean and standard deviation for each measurement. 
- Uses descriptive activity names to name the activities in the data set
- Appropriately labels the data set with descriptive variable names. 
- creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## The Raw Data
The data unzipped are: activity_labels.txt, features.txt, features_info.txt, README.txt and Test and Train data which comprise of: 
  x_test.txt, y_test,txt, subject_test.txt,
  x_train.txt, y_train,txt, subject_train.txt,

## Reading the Data
The steps are to:
-	read the data in .txt format into a table format in R using read.table
-	Merge the  training and test datasets using rbind
-	Extracts only the mesaurements on the mean and std deviation for each measurement using grep and concatenate
-	Give descriptive activity names using as.character
-	Label the dataset with descriptive variable names using gsub
-	Create tidy.txt using as.factor, aggregate and write.table
The final data (tidy data)  has 80 observations  and 88 variables.

## The final data submitted - tidy data
this is the output data in .txt format submitted in this repository.


