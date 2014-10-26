TidyDataAssignment
==================

Course Project submission for project work in "Getting and Cleaning"  Data Course. Following are the steps executed by the script to solve the objectives of the project. These steps are also part of the comments in the script itself. 

# STEP 1.Merges the training and the test sets to create one data set.
#-----------------------------------------------------------------------

# 1. Work on Training Data
## 1.1 Read x_train File
## 1.2 Read subject_train file
## 1.3 Read y-train File
## 1.4 Merge Training Data from Steps 1.1 to 1.3 into trainData
## 1.5 Rename the Column with proper names such as "Subject"

# 2. Work on Test Data
## Repeat Steps 1.1 to 1.5 for Test data and store it in "testData"

# 3. rbind the train and  test data into one called "allData
#---------------------------------------------
#END OF STEP 1
#---------------------------------------------
# STEP 2. Extracts only the measurements on the mean and 
# standard deviation for each measurement
# --------------------------------------------
# 1. Read features file and Find the coloumns from Features list that correspond 
# to mean and Standard Deviation
# 2. Add 3 to all elements of requiredCols to cater for 
# the 3 additional cols added in the last step
# 3. Subset allData to only required cols  and Store in 'requiredData

#---------------------------------------------
#END OF STEP 2
#---------------------------------------------

# STEP 3 3.Uses descriptive activity names to name the 
# activities in the data set
#---------------------------------------------

# 1. Read the activity names form the Activity_labels File
#2 . Add the activity Labels to requiredData
#---------------------------------------------
#END OF STEP 3
#---------------------------------------------

# STEP 4 Appropriately labels the data set with 
# descriptive variable names
#---------------------------------------------

# For each col in required data from 4 to 82, lookup the description 
# from the features file and change the col name
# 2. remove activity labels column and replace with Activity Column
#---------------------------------------------
#END OF STEP 4
#---------------------------------------------

# STEP 5 5.From the data set in step 4, creates a second, 
# independent tidy data set with the average of each variable 
# for each activity and each subject.

# --------------------------------------------

# 1. Load Library reshape2
# 2. Melt requiredData with id.vars = Activity and Subject and store in tidyData
#3 . cast tidydata into skinny Data frame. 
#4 . Write the final cast of tidyData to file

#---------------------------------------------
#END OF STEP 5
#---------------------------------------------





