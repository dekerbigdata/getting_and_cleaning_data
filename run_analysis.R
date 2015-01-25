### run_analysis.R

# Set the working directory on the github repository you just dowloaded

setwd("/Users/davidquer/Projects/getting_and_cleaning_data/") ## change the path for your machine

# Download UCI HAR Dataset in the working directory

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
temp <- "UCI_HAR_dataset.zip"
download.file(fileUrl, destfile=temp, method="curl")
unzip(temp, exdir = "./")

# Reading data
features = read.table('./UCI HAR Dataset/features.txt', header=FALSE)
activity_labels = read.table('./UCI HAR Dataset/activity_labels.txt', header=FALSE)

# Test data set
subject_test = read.table('./UCI HAR Dataset/test/subject_test.txt', col.names = "subject_id")
X_test = read.table('./UCI HAR Dataset/test/X_test.txt', col.names = features$V2)
y_test = read.table('./UCI HAR Dataset/test/y_test.txt', col.names = "activity") 

test_data = cbind(subject_test, y_test, X_test)

# Train data set
subject_train = read.table('./UCI HAR Dataset/train/subject_train.txt', col.names = "subject_id")
X_train = read.table('./UCI HAR Dataset/train/X_train.txt',  col.names = features$V2)
y_train = read.table('./UCI HAR Dataset/train/y_train.txt', , col.names = "activity")

train_data = cbind(subject_train, y_train, X_train)

# 1. Merge the training and the test sets to create one data set.

merged_data = rbind(test_data, train_data)

# 2. Extract only the measurements on the mean and standard deviation for each measurement. 

features_selected <- grepl('-(mean()|std())\\(', features$V2)
subset_data <- merged_data[features_selected]

# 3. Uses descriptive activity names to name the activities in the data set

subset_data$activity <- factor(subset_data$activity, levels=activity_labels$V1, labels=activity_labels$V2)

# 4. Appropriately labels the data set with descriptive variable names.

col_names  = features$V2[features_selected]; 

col_names = gsub('-mean', 'Mean', col_names)
col_names = gsub('-std', 'Std', col_names)
col_names = gsub('[-()]', '', col_names)
col_names = gsub('^(t)', 'Time', col_names)
col_names = gsub('^(f)', 'Freq', col_names)

colnames(subset_data) = c("subject_id", "activity", col_names);

# 5. From the data set in step 4, creates a second, independent tidy data set with 
#    the average of each variable for each activity and each subject.

tidy_data <- aggregate(. ~ subject_id + activity, data = subset_data, FUN = mean)

# Save the result data set
write.table(tidy_data, './tidy.txt', row.names = FALSE);
