library(dplyr)
library(tidyr)

#Sets the current working directory to [UCI HAR Dataset]
setwd("UCI HAR Dataset")

#Reads the file containing the [6] activities
activity_labels <- read.table("activity_labels.txt")

#Reads the [561] features from the file
features <- read.table("features.txt")

#Sets the working directory into [test]
setwd("test")

#Reads [561] test features of [2947] different observations
x_test <- read.table("X_test.txt")

#Reads [2947] test subject information for each observation
subject_test <- read.table("subject_test.txt")

#Reads [2947] test labels for the activities that the subject is doing
y_test <- read.table("y_test.txt")

#Sets the working directory into [train]
setwd("..")
setwd("train")

#Reads [561] train features of [7352] different observations
x_train <- read.table("X_train.txt")

#Reads [7352] train subject information for each observation
subject_train <- read.table("subject_train.txt")

#Reads [7352] train labels for the activities that the subject is doing
y_train <- read.table("y_train.txt")

##Now we are done with reading all the files!!

#Making activity_labels as a character vector from 6x2 table
activity_labels <- activity_labels$V2

#Making features as a character vector from 561x2 table
features <- features$V2

## [1] Merges the training and the test sets to create one data set
#Merging the train and test data sets by [rbind]
x_total <- rbind(x_train, x_test)
subject_total <- rbind(subject_train, subject_test)
y_total <- rbind(y_train, y_test)

#Merges the subject and activity label[y_total] column as well by [cbind] [10299x563]
merged_data <- cbind(x_total, subject_total, y_total)

## [2] Extracts only the measurements on the mean and standard deviation for each 
#  measurement

#Changing the colnames to apply grep() along with select()
colnames(merged_data)[562] <- "subject"
colnames(merged_data)[563] <- "activity"

#Extracted Data of mean and std only [10299x86]
merged_data <- select(merged_data, grep("[Mm]ean|[Ss]td", features))

merged_data <- cbind(merged_data, subject_total, y_total)
colnames(merged_data)[87] <- "subject"
colnames(merged_data)[88] <- "activity"

## [3] Uses descriptive activity names to name the activities in the data set
#Changes 1:6 to the variable names present activity_labels
merged_data <- mutate(merged_data, activity = activity_labels[activity])

## [5] From the data set in step 3, creates a second, independent tidy data set with the
#  average of each variable for each activity and each subject.

tidy_data <- merged_data %>%
             group_by(subject, activity) %>%
             summarise_all(mean)

#Changing the colnames of the tidy data
colnames(tidy_data)[3:88] <- grep("[Mm]ean|[Ss]td", features, value = TRUE)

#Goes back to [UCI HAR Dataset]
setwd("..")
write.table(tidy_data, "TidyData.txt", row.name = FALSE)