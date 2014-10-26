# Script for Assignment in Getting and Cleaning Data Course



# STEP 1.Merges the training and the test sets to create one data set.
#-----------------------------------------------------------------------

# 1. Work on Training Data
## 1.1 Read x_train File
X_train <- read.table("~/data/train/X_train.txt", quote="\"")

## 1.2 Read subject_train file
subject_train <- read.table("~/data/train/subject_train.txt", quote="\"")

## 1.3 Read y-train File
y_train <- read.table("~/data/train/y_train.txt", quote="\"")


# 1.4 Merge Training Data from Steps 1.1 to 1.3 into "Train_data 

trainData<- cbind(subject_train,y_train,X_train)

# 1.5 Rename the Col with proper names
colnames(trainData)[1]<- "Subject"
colnames(trainData)[2]<- "Activity_Label"

# 2. Work on Test Data
## Repeat Steps 1.1 to 1.5 for Test data and store it in "testData"
X_test<- read.table("./test/X_test.txt")
subject_test <- read.table("./test/subject_test.txt")
y_test <- read.table("./test/y_test.txt")
testData<- cbind(subject_test, y_test, X_test)
colnames(testData)[1]<- "Subject"
colnames(testData)[2]<- "Activity_Label"

# 3. Combine the train and  test data into one called "allData
allData<- rbind(trainData, testData)

#---------------------------------------------
#END OF STEP 1
#---------------------------------------------

# STEP 2. Extracts only the measurements on the mean and 
# standard deviation for each measurement
# --------------------------------------------

# 1. Read features file and Find the coloumns from Features list that correspond 
# to mean and Standard Deviation

features<- read.table("./features.txt")
requiredCols<- grep("mean", features$V2)
requiredCols<- c(requiredCols, grep("std", features$V2))
requiredCols<- sort(requiredCols, decreasing=F)

# 2. Add 3 to all elements of requiredCols to cater for 
# the 3 additional cols added in the last step

requiredCols<- sapply(requiredCols, function(x) x+2)

# subset allData to only required cols  and Store in 'requiredData

requiredData<- allData[, c(1:2, requiredCols)]

#---------------------------------------------
#END OF STEP 2
#---------------------------------------------

# STEP 3 3.Uses descriptive activity names to name the 
# activities in the data set
#---------------------------------------------

# 1. Read the activity names form the Activity_labels File
activity_labels <- read.table("./activity_labels.txt")


#2 . Add the activity Labels to requiredData

requiredData<- merge(requiredData, activity_labels, by.x="Activity_Label", 
                     by.y= "V1")

#---------------------------------------------
#END OF STEP 3
#---------------------------------------------

# STEP 4 Appropriately labels the data set with 
# descriptive variable names
#---------------------------------------------

# For each col in required data from 4 to 82, lookup the description 
# from the features file and change the col name
m<- 1
for (i in 3: (length(requiredCols)-1))
{
  j<- requiredCols[m]
  colnames(requiredData)[i]<- as.character(features[j-2, 2])
  m=m+1
}

colnames(requiredData)[length(requiredData)]<- "Activity"

# 2. remove activity labels column and replace with Activity Column
requiredData[,1]<- requiredData[,82]
colnames(requiredData)[1]<- "Activity"
requiredData<- requiredData[-82]

#---------------------------------------------
#END OF STEP 4
#---------------------------------------------

# STEP 5 5.From the data set in step 4, creates a second, 
# independent tidy data set with the average of each variable 
# for each activity and each subject.

# --------------------------------------------

# 1. Load Library reshape2

# 2. Melt requiredData with id.vars = Activity and Subject
tidyData<- melt(requiredData, id.vars= 1:2)

#3 . cast tidydata into skinny Data frame. 
td<- dcast(tidyData, Activity + Subject ~ variable, mean)

#4 . Write the final cast of Tidy Data to file
write.table(td, file="./tidyData.txt", row.names=F)

#---------------------------------------------
#END OF STEP 5
#---------------------------------------------
