# Getting and Cleaning Data Code Book

## Original Dataset Information

This data is got from [UCI HAR Dataset](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). This dataset has two columns, Subject and Activity, are identifiers.

- Subject: the ID of the subject
- Activity: the name of human activity type

And to analyze columnes below.

- tBodyAcc-XYZ
- tGravityAcc-XYZ
- tBodyAccJerk-XYZ
- tBodyGyro-XYZ
- tBodyGyroJerk-XYZ
- tBodyAccMag
- tGravityAccMag
- tBodyAccJerkMag
- tBodyGyroMag
- tBodyGyroJerkMag
- fBodyAcc-XYZ
- fBodyAccJerk-XYZ
- fBodyGyro-XYZ
- fBodyAccMag
- fBodyAccJerkMag
- fBodyGyroMag
- fBodyGyroJerkMag

## Analyze Dataset
The following flow is to create tidy dataset.
1. Read dataset,  and calculate mean and standard deviation for each measurement.
2. Activities to analyze are written in activity_labels.txt. So extracting features "Subject" and "Activity".
3. Create tidy dataset and save as "tidy_dataset.txt" 