##Getting and Cleaning Data Course Project

###Purpose

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. The grading will be performed by your peers on a series of yes/no questions related to the project. You are required to submit the following:
*A tidy data set as described below;
*A link to a Github repository with a script (run.analysis.R) for performing the analysis; and
*A code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called Codebook.md.
*A README.md with the script to explain how all of the scripts work and how they are connected.

###Objectives

The R script called run_analysis.R performs and does the following:
*Merges the training and the test sets to create one data set.
*Extracts only the measurements on the mean and standard deviation for each measurement.
*Uses descriptive activity names to name the activities in the data set
*Appropriately labels the data set with descriptive activity names.
*Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

###run_analysis.R

*This script downloads the UCI HAR Dataset data set and puts the zip file into my working directrory "C:/Users/pekst/Documents/Coursera/R. After the download is complete, it unzips the file into the Dataset folder "C:/Users/pekst/Documents/Coursera/R/data.
*The datasets are read in file-by-file and the merge_train and merge_test datasets are created.
*merge_train is created using cbind to bind y_train, subject_train, x_train and merge_test is created in the same way to bind y_test, subject_test, x_test.
*dataset1 is then created using rbind to bind merge_train and merge_test.
*It extracts just the mean and standard deviation from the features data set. This is done using grepl.
*After cleaning the column names, these are applied to the x data frame.
*Finnally I created the mean of activities and subjects into a separate tidy dataset called tidy_dataset.txt which I exported into the C:/Users/pekst/Documents/Coursera/R folder. The link to this final tidy dataset is submitted with this project. 
