############################################
# Getting & Cleaning Data - Course Project #
############################################

# this script uses the dplyr library for table manipulation
library(dplyr)

##------------------------------------------
## STEP 1: GETTING THE DATA 
##------------------------------------------
# fetch the data
if (!file.exists("./data")){dir.create("./data")}
outDir <- "./data"
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
zipFile <- "./dataset.zip"
dataDir <- "./data/UCI HAR Dataset/"
trainingDataDir <- paste0(dataDir,"train/")
testDataDir <- paste0(dataDir,"test/")

# download the file if it was not downloaded before
if (!file.exists(zipFile)) {
    download.file(zipUrl, destfile=zipFile)
}

# unzip the file if it was not done before
if (!file.exists(dataDir)) {
    unzip(zipFile, exdir=outDir)
}

##------------------------------------------
## STEP 2: READING THE DATA 
##------------------------------------------

# read training data
trainingSubjects <- read.table(file.path(trainingDataDir, "subject_train.txt"))
trainingSet <- read.table(file.path(trainingDataDir, "X_train.txt"))
trainingLabels <- read.table(file.path(trainingDataDir, "y_train.txt"))

trainingDataSet <- cbind(trainingSubjects, trainingSet, trainingLabels)

# read test data
testSubjects <- read.table(file.path(testDataDir, "subject_test.txt"))
testSet <- read.table(file.path(testDataDir, "X_test.txt"))
testLabels <- read.table(file.path(testDataDir, "y_test.txt"))

testDataSet <- cbind(testSubjects, testSet, testLabels)

# read features & activities
features <- read.table(file.path(dataDir, "features.txt"), as.is = TRUE)
colnames(features) <- c("featureId", "featureLabel")
activities <- read.table(file.path(dataDir, "activity_labels.txt"))
colnames(activities) <- c("activityId", "activityLabel")

## CLEANING UP - save some space (largest sets...)
rm(trainingSet, testSet)

##------------------------------------------
## STEP 3: MERGING & LABELING THE DATA 
##------------------------------------------
fullDataSet <- rbind(trainingDataSet, testDataSet)
colnames(fullDataSet) <- c("subject", features$featureLabel, "activity")

## CLEANING UP - save some space (largest sets...)
rm(trainingDataSet, testDataSet)

##------------------------------------------
## STEP 4: ONLY KEEP MEAN AND STD + USED DESCR. NAMES
##------------------------------------------
columnsToKeep <- grepl("subject|activity|mean|std", colnames(fullDataSet))
selectedDataSet <- fullDataSet[, columnsToKeep]
rm(fullDataSet)
selectedDataSet$activity <- factor(selectedDataSet$activity, 
                                 levels = activities$activityId, labels = activities$activityLabel)

##------------------------------------------
## STEP 5: CREATE READABLE COLUMN NAMES
##------------------------------------------
readableColumnNames <- colnames(selectedDataSet)
readableColumnNames <- gsub("[\\(\\)-]", "", readableColumnNames)
readableColumnNames <- gsub("^f", "frequency", readableColumnNames)
readableColumnNames <- gsub("^t", "time", readableColumnNames)
readableColumnNames <- gsub("Acc", "Accelerometer", readableColumnNames)
readableColumnNames <- gsub("Gyro", "Gyroscope", readableColumnNames)
readableColumnNames <- gsub("Mag", "Magnitude", readableColumnNames)
readableColumnNames <- gsub("Freq", "Frequency", readableColumnNames)
readableColumnNames <- gsub("mean", "Mean", readableColumnNames)
readableColumnNames <- gsub("std", "StandardDeviation", readableColumnNames)
readableColumnNames <- gsub("BodyBody", "Body", readableColumnNames)
colnames(selectedDataSet) <- readableColumnNames

##------------------------------------------
## STEP 6: CREATE TIDY DATA SET WITH MEANS
##------------------------------------------
tidyDataSet <- group_by(selectedDataSet, subject, activity)
tidyDataSet <- summarise_all(tidyDataSet, funs(mean))
write.table(tidyDataSet, "./data/tidy_data.txt", row.names = FALSE, quote = FALSE)