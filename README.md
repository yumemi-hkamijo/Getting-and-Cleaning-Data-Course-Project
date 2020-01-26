# getting-and-cleaning-data-4week

## Initial Dataset 

This dataset is about human activity recognition using smartphones(a.k.a UCI HAR dataset). This dataset has 3 train data and 3 test data.

- train/X_train.txt
- test/X_test.txt
- train/subject_train.txt
- test/subject_test.txt
- train/y_train.txt
- test/y_test.txt

## how R script works

1. Download dataset and make directory to save to unzip directory.
2. Read all train and test datasets, and merge each datasets
3. Load features.txt and activity_labels.txt to get features information. And extract "mean" and "std" columes.
4. Label dataset with "mean" and "std" columes.
5. Create tidy dataset from the dataset in step4. Save the tidy dataset as "tidy_dataset.txt"