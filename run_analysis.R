## Course 3 Project (Getting and Cleaning Data)
## Run_analysis.R
## to be submitted to github together with:
## CodeBook.md --- work performed to clean up the data
## and 
## README.md --- explaination on how all of the scripts work and how they are connected

install.packages("data.table")
library(data.table)

## get the zip file from the link given in Project Assignment Page at COursera
## download the file, and unzip the files
## Make sure working directory is set properly

fileURL<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileURL, destfile="./MyData.zip")
unzip("./MyData.zip")

featureNames <- read.table("UCI HAR Dataset/features.txt")
activityNames <- read.table("UCI HAR Dataset/activity_labels.txt", header = FALSE)

## Read all the data in .txt format into a table format in R
## Data is divided into train data (70%) and test data (30%).
##
featuresTrainData<-read.table("./UCI HAR Dataset/train/X_train.txt")
activityTrainData<-read.table("./UCI HAR Dataset/train/y_train.txt")  
## this is the activity code for the train data
SubjectTrainData<-read.table("./UCI HAR Dataset/train/subject_train.txt")

featuresTestData<-read.table("./UCI HAR Dataset/test/X_test.txt")
activityTestData<-read.table("./UCI HAR Dataset/test/y_test.txt")  ## this is the activity code for the test data
SubjectTestData<-read.table("./UCI HAR Dataset/test/subject_test.txt")

##dim(featuresTrainData)     [1] 7352  561
##dim(activityTrainData)     [1] 7352    1
##dim(SubjectTrainData)      [1] 7352    1
##dim(featuresTestData)      [1] 2947  561
## dim(activityTestData)     [1] 2947    1
## dim(SubjectTestData)      [1] 2947    1

## Step 1. Merge the training and the test sets to create one data set.
## merge train and test dataset to create one dataset of each (X, Y-activity, Subject)
All_features<-rbind(featuresTrainData, featuresTestData)  ## combines train data and test data
All_activity<-rbind(activityTrainData, activityTestData)  ## combines train and test Activity data 
All_subject<-rbind(SubjectTrainData, SubjectTestData)  ## combines train and test Subject data

colnames(All_subject)<-"Subject"  ## column name of All_subject is named "Subject"
## names(All_subject)             [1] "Subject"
colnames(All_activity)<-"Activity"
## names(All_activity)            [1] "Activity"
## column names of All_features is given the names from 2nd variable in featureNames
colnames(All_features)<-t(featureNames[2])  
All_Data<-cbind(All_features, All_subject, All_activity)
dim(All_Data)   ## 10,299 observations 563 variables
str(All_Data)

## step 2. Extracts only the measurements on the mean and standard deviation f
## or each measurement
All_features_ms<-grep(".*Mean.*|.*Std.*", names(All_Data), ignore.case=TRUE)
View(All_features_ms)  ##n 86 observations 1 variable

Requiredcolumns<-c(All_features_ms, 562, 563)
View(Requiredcolumns)  ##  88 obs 1 var
MyData<-All_Data[,Requiredcolumns]      ##########
View(MyData)    ## 10,299 observations 88 variables

##step 3 Uses descriptive activity names to name the activities in the data set
## combine all datasets
##All_data<-cbind(All_subject, All_activity, All_features)
## dim(All_data)                   [1] 10299   563
## columns are: "SUbject" with values 1,2,3,... "Activity" with values 1,2,3,4,5,6 (numeric)
## "tBodyAcc-mean()-X" with values 0.2885845.... and so on.
## need to give descriptive activity names to values (1-6) in column "Activity"

MyData$Activity <- MyData$Activity <- as.character(MyData$Activity)
for (i in 1:6){
  MyData$Activity[MyData$Activity == i] <- as.character(activityNames[i,2])
}
View(MyData)     ## 10,299 observations 88 variables


## Step 4. Appropriately labels the data set with descriptive variable names. 
#Set the activity variable in the data as a factor
MyData$Activity <- as.factor(MyData$Activity)
names(MyData)   ## get variable names (observe the column names)
## Labels are:
#    Acc     - Accelerometer
#    Gyro    - Gyroscope
#    BodyBody - Body
#    Mag   - Magnitude
#    'f'   - Frequency
#    't'   - Time

names(MyData) <- gsub("Acc", "Accelerometer", names(MyData))
names(MyData) <- gsub("Gyro", "Gyroscope", names(MyData))
names(MyData) <- gsub("BodyBody", "Body", names(MyData))
names(MyData) <- gsub("Mag", "Magnitude", names(MyData))
names(MyData) <- gsub("^t", "Time", names(MyData))
names(MyData) <- gsub("^f", "Frequency", names(MyData))
names(MyData) <- gsub("tBody", "TimeBody", names(MyData))
names(MyData) <- gsub("-freq()", "Frequency", names(MyData), ignore.case = TRUE)

View(MyData)     ## 10,299 observations 88 variables
names(MyData)           ## get variable names after gsub (observe the column names)
##


## Step 5. From the data set in step 4, creates a second, independent tidy data set 
##         with the average of each variable for each activity and each subject.
MyData$Subject <- as.factor(MyData$Subject)
MyData <- data.table(MyData)

# Create tidyData - with average for each activity and subject
tidyData <- aggregate(. ~Subject + Activity, MyData, mean)

#  Order tidayData according to subject and activity
tidyData <- tidyData[order(tidyData$Subject,tidyData$Activity),]

#  Write tidyData into a text file
write.table(tidyData, file="tidy.txt", row.names = FALSE)

View(tidyData)  ## 180 observations 88 variables
