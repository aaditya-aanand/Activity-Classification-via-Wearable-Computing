# Getting-and-Cleaning-Data
Course Project of Data Science Specialisation: Getting and Cleaning Data 

##Read this README.md while looking at run_analysis.R scrip. It'll be easier to understand!!

#Sets the current working directory to [UCI HAR Dataset]
setwd("UCI HAR Dataset")

#Reads the file containing the [6] activities
#Reads the [561] features from the file

#Sets the working directory into [test]
setwd("test")

#Reads [561] test features of [2947] different observations
#Reads [2947] test subject information for each observation
#Reads [2947] test labels for the activities that the subject is doing

#Sets the working directory into [train]
setwd("..")
setwd("train")

#Reads [561] train features of [7352] different observations
#Reads [7352] train subject information for each observation
#Reads [7352] train labels for the activities that the subject is doing

##Now we are done with reading all the files!!

#Making activity_labels as a character vector from 6x2 table
activity_labels <- activity_labels$V2

#Making features as a character vector from 561x2 table
features <- features$V2

## [1] Merges the training and the test sets to create one data set
#Merging the train and test data sets by [rbind]

#Merges the subject and activity label[y_total] column as well by [cbind] [10299x563]

## [2] Extracts only the measurements on the mean and standard deviation for each 
#  measurement

#Changing the colnames to apply grep() along with select()
colnames(merged_data)[562] <- "subject"
colnames(merged_data)[563] <- "activity"

#Extracted Data of mean and std only [10299x86]

## [3] Uses descriptive activity names to name the activities in the data set
#Changes 1:6 to the variable names present activity_labels

## [5] From the data set in step 3, creates a second, independent tidy data set with the
#  average of each variable for each activity and each subject.

#Changing the colnames of the tidy data

#Goes back to [UCI HAR Dataset]
setwd("..")
write.table(tidy_data, "TidyData.txt", row.name = FALSE)
