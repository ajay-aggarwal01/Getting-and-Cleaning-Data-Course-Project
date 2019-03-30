##
## The purpose of this project is to demonstrate how to collect, work with, and clean a data set.
##

## The dplyr package makes these steps fast and easy:
## It provides simple "verbs", functions that correspond to the most common data manipulation tasks.
## It uses efficient backends, so you spend less time waiting for the computer.
## Reference: https://cran.r-project.org/web/packages/dplyr/vignettes/dplyr.html
##

library(dplyr)

## Set working Directory 
##
setwd("D:/Work/mystuff/Education/DataScience/Getting and Cleaning Data")


# 'features.txt': List of all features.
my_features <- read.table("UCI HAR Dataset/features.txt")

##  Q4 Appropriately labels the data set with descriptive variable names
## =======================================================================
# prefix t is replaced by time
# Acc is replaced by Accelerometer
# Gyro is replaced by Gyroscope
# prefix f is replaced by frequency
# Mag is replaced by Magnitude
# BodyBody is replaced by Body
# () is removed

my_features$V2 <- gsub("^t", "time",my_features$V2)
my_features$V2 <- gsub("^f", "frequency",my_features$V2)
my_features$V2 <- gsub("Acc", "Accelerometer",my_features$V2)
my_features$V2 <- gsub("Gyro", "Gyroscope",my_features$V2)
my_features$V2 <- gsub("Mag", "Mag",my_features$V2)
my_features$V2 <- gsub("BodyBody", "Body",my_features$V2)
my_features$V2 <- gsub("\\(\\)","",my_features$V2)

# Read Training Data 
# 1. read Subject Train 
# 2. Assign column label to subject train 
# 3. Read Training sets
# 4. assign column names given in the features
# 5. Read Training labels. 
# 6. Assign column name to training label 
##

## 1
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
                             
# 2
names(subject_train) <- "subject" 
                             
# 3
x_train <- read.table("UCI HAR Dataset/train/X_train.txt")

# 4
names(x_train) <- my_features$V2

# 5
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")

# 6
names(y_train) <- "activitylabel"


# Read Test Data 
# 1. read Subject  
# 2. Assign column label to subject  
# 3. Read Test sets
# 4. assign column names given in the features
# 5. Read Test labels. 
# 6. Assign column name to Test label 
##

## 1
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")

# 2
names(subject_test) <- "subject" 

# 3
x_test <- read.table("UCI HAR Dataset/test/X_test.txt")

# 4
names(x_test) <- my_features$V2

# 5
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")

# 6
names(y_test) <- "activitylabel"


training_data <- data.frame(subject_train, y_train, x_train)
test_data     <- data.frame(subject_test, y_test, x_test)

##  Q1. Merges the training and the test sets to create one data set.
## =================================================================

mydataset         <- rbind(training_data, test_data)

## Q2: Extracts only the measurements on the mean and standard deviation for each measurement.
## ==========================================================================================

my_columns <-  grepl("mean", names(mydataset)) |grepl("std", names(mydataset))

## Extract 1st two columns (subject and activitylabel ) also
##
my_columns[1:2]<- TRUE

my_sample_data <- mydataset[,my_columns]



## Q3:Uses descriptive activity names to name the activities in the data set
## =========================================================================

# Reading 'activity_labels.txt': Links the class labels with their activity name.
activity_label <- read.table("UCI HAR Dataset/activity_labels.txt")

# Reading 'activity_labels.txt': Links the class labels with their activity name.
my_sample_data$"activitylabel" <- as.character(activity_label[match(my_sample_data$"activitylabel",activity_label$V1 ), "V2"])


## Q5: From the data set in step 4, creates a second, independent tidy data set with the average of 
## each variable for each activity and each subject.

tidy_data2<-aggregate(. ~subject + activitylabel, my_sample_data, mean)
tidy_data2<-tidy_data2[order(tidy_data2$subject,tidy_data2$activitylabel),]

write.table(tidy_data2, file="tidy_data.txt", row.name=FALSE)
