

# Course3Project
Course 3 Project Assignment
Getting and Cleaning Data

## Introduction
This repository is a requirement for Project Assignment of Course 3 (Getting and Cleaning Data).

The repository consists of:
- Readme.md (this file gives the introduction and explanation)
- CodeBook.md (this is the code book that describes the variables, the data, and any transformations or work that was performed to clean up the data 
- run_analysis.R  (the R script that does the steps required)

## The Requirement
The requirement of the project is to write an R script (run_analysis.R) to read some data given from a link to a website 
   https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

This is the data collected from the accelerometers from the Samsung Galaxy S smartphone.
30 subjects performed activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors.
The 30 volunteers were within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist.
Using the embedded accelerometer and gyroscope, 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz were captured. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers were selected for generating the training data and 30% the test data. 

The data is then unzipped, read into R, and does the following:
- Merges the training and the test sets to create one data set.
- Extracts only the measurements on the mean and standard deviation for each measurement. 
- Uses descriptive activity names to name the activities in the data set
- Appropriately labels the data set with descriptive variable names. 
- creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## The Data
The data unzipped are: activity_labels.txt, features.txt, features_info.txt, README.txt and Test and Train data which comprise of: 
  x_test.txt, y_test,txt, subject_test.txt,
  x_train.txt, y_train,txt, subject_train.txt,

## The Steps

## Step 1: Merges the training and the test sets to create one data set.

-	Read the data in .txt format into a table format in R using read.table
-	merge train and test dataset to create one dataset of each (X, Y-activity, Subject)
-	The datasets are: All_features, All_activity, All_subject (using rbind)
-	All datasets are then merged into one dataset (All_Data) using cbind
-	All_Data has 10,299 observations (rows) and 563 variables (columns)

## Step 2:  Extracts only the measurements on the mean and standard deviation for each measurement 

-	using grep, get all variables that have “mean” and “std”
-	this is assigned to Requiredcolumns

## Step 3: Use descriptive activity names to name the activities inn the data set

-	Give descriptive activity names using as.character
-	this is done to give names to numeric 1-6 as “WALKING”, “WALKING_UPSTAIRS”, “WALKING_DOWNSTAIRS”, “SITTING”, “STANDING”, “LAYING”.

## Step 4:  Appropriately labels the data set with descriptive variable names. 

-	Label the dataset with descriptive variable names using gsub.
-	Descriptive variable names used were:  Accelerometer (Acc ), Gyroscope  (Gyro), Body (BodyBody),  Magnitude  (Mag),  Frequency (freq), and Time (t).

## Step 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

-	Create tidy.txt using as.factor, aggregate and write.table
-	This final data is submitted. has 180 observations  and 88 variables.
