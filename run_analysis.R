#setting up working directory
setwd("e://my learning/coursera/r/pract/getdata/UCI HAR Dataset")
#Reading data files
library("data.table")
library("plyr")
# 1) Merges the training and the test sets to create one data set.
trainX <- read.table("./train/X_train.txt")
trainY <- read.table("./train/y_train.txt")
trainsub <- read.table("./train/subject_train.txt")
dim(trainX)
# 7352   561
dim(trainY)
# 7352   1
dim(trainsub)
# 7352   1
head(trainX)
head(trainY)
testX <- read.table("./test/X_test.txt")
testY <- read.table("./test/y_test.txt")
testsub <- read.table("./test/subject_test.txt")
dim(testX)
# 2947   561
dim(testY)
# 2947   1
dim(testsub)
# 2947   1
comboX <- merge(trainX, testX, all=TRUE)
dim(comboX)
# 10299  561
comboY <- rbind(trainY, testY, all=TRUE)
dim(comboY)
# 10299  1
combosub <- rbind(trainsub, testsub)
dim(combosub)
# 10299  1

# 2)Extracts only the measurements on the mean and standard deviation for each measurement.
features <- read.table("./features.txt")
head(features)
dim(features)
# 561    2
mean_std <- grep("-(mean|std)\\(\\)", features[,2])
length(mean_std)
head(mean_std)
dim(comboX)
names(comboX) <- gsub("mean", "Mean", names(comboX)) 
# capitalize M
names(comboX) <- gsub("std", "Std", names(comboX)) 
# capitalize S
names(comboX) <- gsub("-", "", names(comboX)) 
# remove "-" in column names 
head(comboX)

# 3 & 4)Uses descriptive activity names to name the activities in the data set & Appropriately labels the data set with descriptive variable names.
activity <- read.table("./activity_labels.txt")
comboY[, 1] <- activity[comboY[, 1], 2]
names(comboY) <- "activity"
names(combosub) <- "subject"
cleanedData <- cbind(combosub, comboX, comboY)
dim(cleanedData) # 10299*68
write.table(cleanedData, "first_tidy_data.txt")

# 5) From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
avg_tidy_data <- ddply(cleanedData, .(subject, activity), function(x) colMeans(x[, 1:66]))
write.table(avg_tidy_data, "averages_data.txt", row.name=FALSE)
head(avg_tidy_data)

