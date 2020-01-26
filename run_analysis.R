# install library
library(reshape2)


# get Human Activity Recognition Using Smartphones Data Set
# detail: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
zipdata_dir <- "./zip_data"
dataset_URL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
dataset_filename <- "dataset.zip"
dataset_dir_file <- paste(zipdata_dir, "/", dataset_filename, sep = "")
dataset_dir <- "./data"

if (!file.exists(zipdata_dir)) {
  dir.create(zipdata_dir)
  download.file(url = dataset_URL, destfile = dataset_dir_file)
}
if (!file.exists(dataset_dir)) {
  dir.create(dataset_dir)
  unzip(zipfile = dataset_dir_file, exdir = dataset_dir)
}

# mearge test and train dataset

# collect train data
x_train <- read.table(paste(sep = "", dataset_dir, "/UCI HAR Dataset/train/X_train.txt"))
y_train <- read.table(paste(sep = "", dataset_dir, "/UCI HAR Dataset/train/Y_train.txt"))
sub_train <- read.table(paste(sep = "", dataset_dir, "/UCI HAR Dataset/train/subject_train.txt"))

# collect test data
x_test <- read.table(paste(sep = "", dataset_dir, "/UCI HAR Dataset/test/X_test.txt"))
y_test <- read.table(paste(sep = "", dataset_dir, "/UCI HAR Dataset/test/Y_test.txt"))
sub_test <- read.table(paste(sep = "", dataset_dir, "/UCI HAR Dataset/test/subject_test.txt"))

# merge train, test data
x_data <- rbind(x_train, x_test)
y_data <- rbind(y_train, y_test)
sub_data <- rbind(sub_train, sub_test)

# get features
features <- read.table(paste(sep = "", dataset_dir, "/UCI HAR Dataset/features.txt"))

# get activity labels
activity_label <- read.table(paste(sep = "", dataset_dir, "/UCI HAR Dataset/activity_labels.txt"))
activity_label[,2] <- as.character(activity_label[,2])

# extract features columes named "mean" and "std"
selected_columes <- grep("-(mean|std).*", as.character(features[,2]))
selected_columes_name <- features[selected_columes, 2]
selected_columes_name <- gsub("-mean", "Mean", selected_columes_name)
selected_columes_name <- gsub("-std", "Std", selected_columes_name)
selected_columes_name <- gsub("[-()]", "", selected_columes_name)


# extract data by columes 
x_data <- x_data[selected_columes]
all_data <- cbind(sub_data, y_data, x_data)
colnames(all_data) <- c("Subject", "Activity", selected_columes_name)

all_data$Activity <- factor(all_data$Activity, levels = activity_label[,1], labels = activity_label[,2])
all_data$Subject <- as.factor(all_data$Subject)


# create tidy dataset
melted_dataset <- melt(all_data, id = c("Subject", "Activity"))
tidy_dataset <- dcast(melted_dataset, Subject + Activity ~ variable, mean)

write.table(tidy_dataset, "./tidy_dataset.txt", row.names = FALSE, quote = FALSE)
