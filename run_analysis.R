setwd("C:/Users/pekst/Documents/Coursera/R")
if (!require("tictoc")) {
        install.packages("tictoc")
        library(tictoc)
}
##--Download datasets
if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="./data/Dataset.zip")

##--Unzip dataSet to /data directory
unzip(zipfile="./data/Dataset.zip",exdir="./data")

##--Reading trainings tables:
tic()
x_train <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./data/UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")

##--Reading testing tables:
x_test <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./data/UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")

##--Reading feature vector:
features <- read.table('./data/UCI HAR Dataset/features.txt')

##--Reading activity labels:
activity_labels = read.table('./data/UCI HAR Dataset/activity_labels.txt')
toc()
gc()

##--Assign column names
colnames(x_train) <- features[,2] 
colnames(y_train) <-"activity_id"
colnames(subject_train) <- "subject_id"

colnames(x_test) <- features[,2] 
colnames(y_test) <- "activity_id"
colnames(subject_test) <- "subject_id"

colnames(activity_labels) <- c('activity_id','activity_type')

##--Merge datasets
merge_train <- cbind(y_train, subject_train, x_train)
merge_test <- cbind(y_test, subject_test, x_test)
dataset1 <- rbind(merge_train, merge_test)

##--Read Column names
column_names <- colnames(dataset1)

##--Define ID, mean and std deviation
mean_and_std_dev <- (grepl("activity_id" , column_names) | 
                 grepl("subject_id" , column_names) | 
                 grepl("mean.." , column_names) | 
                 grepl("std.." , column_names) 
                )

dataset2 <- dataset1[ , mean_and_std_dev == TRUE]

dataset3 <- merge(dataset2, activity_labels,
                              by='activity_id',
                              all.x=TRUE)

##--Create tidy dataset
tidy_dataset <- aggregate(. ~subject_id + activity_id, dataset3, mean)
tidy_dataset <- tidy_dataset[order(tidy_dataset$subject_id, tidy_dataset$activity_id),]

##--Save tidy dataset
write.table(tidy_dataset, "tidy_dataset.txt", row.name=FALSE)