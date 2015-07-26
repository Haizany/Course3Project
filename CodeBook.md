

# Course3Project  Code Book for Project Assignment 
Course 3 Getting and Cleaning Data

## The Code Book
This code book describes the variables, the data and transformation process performed to clean up the data given.

## The data
The data given is from a link to a website  as follows:
   https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

This is the data collected from the accelerometers from the Samsung Galaxy S smartphone from.
30 subjects / 30 volunteers
Training Data: generated from 70% of the volunteers
Test Data: generated from 30% of the volunteers
Activities performed:  WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING 

## The Variables:
Variables used are: 
featureNames – data frame created for features.txt 
activityNames - data frame created for activity_labels.txt 

Data frames for training data are: featuresTrainData, activityTrainData, and SubjectTrainData
Data frames for test data are: featuresTestData, activityTestData, and SubjectTestData

##The Data:
 The input data from the link are as follows:
-	activity_labels.txt: 	contains the different types of activities
-	features.txt: 		contains the feature names in the data sets
-	X_test.txt: 		contains the variable features for the test data
-	Y_test.txt: 		contains the activities for the test data
-	Subject_test.txt: 	contains the subject information for the test data
-	X_train.txt: 		contains the variable features for the train data
-	Y_train.txt: 		contains the activities for the train data
-	Subject_train.txt: 	contains the subject information for the train data

## The transformation process:
The raw data that was downloaded from the hyperlink given was unzipped and read into R.  The steps are to:
-	read the data in .txt format into a table format in R using read.table
-	Merge the  training and test datasets using rbind
-	Extracts only the measurements on the mean and std deviation for each measurement using grep and concatenate
-	Give descriptive activity names using as.character
-	Label the dataset with descriptive variable names using gsub
-	Create tidy.txt using as.factor, aggregate and write.table
