## Getting and Cleaning Data
### Course Project of Data Science Specialisation: Getting and Cleaning Data 

## Read this README.md while looking at run_analysis.R script. It'll be easier to understand!!

Dataset is downloaded from: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Unzipped folder is called: "UCI HAR Dataset"

First of all, I set the current working directory of R to [UCI HAR Dataset]

## Then I read into every file present in UCI HAR Dataset

Reads the file containing the [6] activities
Reads the [561] features from the file

## Then I set the working directory into [test] directory present in UCI HAR Dataset

Reads [561] test features of [2947] different observations
Reads [2947] test subject information for each observation
Reads [2947] test labels for the activities that the subject is doing

## Then I set the working directory into [train] directory present in UCI HAR Dataset

Reads [561] train features of [7352] different observations
Reads [7352] train subject information for each observation
Reads [7352] train labels for the activities that the subject is doing

Now I'm done with reading all the files!!

Then I made activity_labels as a character vector from 6x2 table
And also, features as a character vector from 561x2 table

## [1] Merges the training and the test sets to create one data set
I merged the training and test data sets by [rbind]
I merged the subject and activity label[y_total] column as well by [cbind] [10299x563]

## [2] Extracts only the measurements on the mean and standard deviation for each measurement

I changed the colnames to apply grep() along with select()
colnames(merged_data)[562] <- "subject"
colnames(merged_data)[563] <- "activity"
Extracted Data of mean and std only [10299x86]

## [3] Uses descriptive activity names to name the activities in the data set
I changed 1:6 to the variable names present in activity_labels

## From the data set in step 3, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

I changed the colnames of the tidy data

## Goes back to [UCI HAR Dataset]
### setwd("..")

write.table(tidy_data, "TidyData.txt", row.name = FALSE)
