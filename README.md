# Getting-and-Cleaning-Data-Course-Project
## Introduction
The purpose of this project is to demonstrate ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site [
Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) 
Here is the [data](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) for the project:

## Assignment Details
1. create one R script called run_analysis.R that does the following.
   a. Merges the training and the test sets to create one data set.
   b. Extracts only the measurements on the mean and standard deviation for each measurement.
   c. Uses descriptive activity names to name the activities in the data set
   d. Appropriately labels the data set with descriptive variable names.
   e. From the data set , creates a second, independent tidy data set with the average of each variable for each activity and each subject.
   
## Steps required before running the R script:

1. Download the zip file from this [URL](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).
2. Unzip the file.
3. Set the working directory where data was dowloaded
   Example:
   a. You are in directory <MyWork>
   b. Data was dounloaded in <MyWork/UCI HAR Dataset>
   c. you will set working directory <MyWork> using setwd command
  
4. You can run the R script (run_analysis.R). 
5. The output of the R script is a tidy data set, tidy_data.txt.

You can read more about the data and the analysis in the [code book](https://github.com/ajay-aggarwal01/Getting-and-Cleaning-Data-Course-Project/blob/master/CodeBookt.Rmd).
