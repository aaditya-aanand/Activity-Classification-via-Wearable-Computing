There are 30 volunteers. They'll be called subject. 
subject from 1 to 30

There are 6 activity. They're labeled from 1 to 6.
c(1:6) = c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING")

Filenames:

[Directory] UCI HAR Dataset : Parent folder containing data files, obtained after unzipping the download

Inside UCI HAR Dataset

1. "README.txt"
2. "activity_labels.txt"
3. "features.txt"       
4. "features_info.txt"
5. "test"
6. "train"

[Directory] train : Contains Training Data
[Directory] test : Contains Test Data

[File] activity_labels.txt : It contains a character vector describing the activity of the subject!
[File] features.txt : It contains a character vector containing the names of all the features.

Inside [train]
"X_train.txt"   "subject_train.txt"   "y_train.txt"

Inside [test]
"X_test.txt"   "subject_test.txt"   "y_test.txt"

Variables:

1. activity_labels: Contains a character vector of length 6
2. features: Contains a character vector of length 561
3. X_test: Contains the test data for 2947 observations of 561 features
4. subject_test: Contains a factor vector of length 2947 having values representing 30 different subjects from 1 to 30
5. y_test: Contains label for each test dataset - What activity the subject was doing?

Similarly for X_train, subject_train, and y_train, these are the variables for training dataset with same description!

Transformation:

1. activity_labels has been transformed to a character vector from the read table of dimension 6x2
2. features has gone through the same transformation
3. "x_total" has been obtained after row binding the "X_test" and "X_train", same with subject_total and y_total, all of these are obtained after row binding!!
4. "merged_data" is obtained after column binding the "x_total" with "subject_total" and "y_total" so that all the data will be contained in just one matrix!
5. Again merged_data goes through the transformation in which we select only those variables which are the measures of mean or std

Finally, we obtain the "tidy_data" by grouping and summarizing by mean to the new "merged_data"

