---
title: "Code Book for Project Work under the Getting and Cleaning Data Course"
author: "Thomas Mathew"
date: "Monday, October 27, 2014"
output: html_document
---


Background:
This code book describes the data,variables and  work performed to clean up the data as per the project objectives. 

Objectives of the project and Data used:
Based on the study and data from the Human Activity Recognition Using Smartphones Data Set  ( http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones), data was available regarding the activities of 30 Subjects. 70% of these subjects were randomly selected to be training group and the remaining were part of the test group. The R script created as part of this project uses this data for the following purposes:

1.Merges the training and the test sets to create one data set.
2.Extracts only the measurements on the mean and standard deviation for each measurement. 
3.Uses descriptive activity names to name the activities in the data set
4.Appropriately labels the data set with descriptive variable names. 
5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


Data:
The raw data used is available here
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Variables:
For the purposes of this project the following variables were used. 

1. Activity:

WALKING, 
WALKING_UPSTAIRS, 
WALKING_DOWNSTAIRS, 
SITTING, 
STANDING, 
LAYING, 


2. Subject: numbered from 1 to 30

3. Other Variables

Quoting from the original Study
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

Based on this the variables show the mean and standard deviation across the "Activity" and "Subject" Variables. 


Transformation / Work Done:

the steps were the following ( as per the script attached with this project)
1: for both test and train data combine the data in the 3 files "subject_train or test", "X_train or test"  and y_train or test.

2. the combined test and train data was then merged and the variables other than the mean and standard deviations were dropped. 

3. the columns were renamed in line the with variable names for better readability

4. Finally the data was melted and recast to arrive at a tidy data set
 
