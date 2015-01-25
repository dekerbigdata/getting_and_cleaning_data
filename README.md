Getting and Cleaning Data Course Project
========================================

This repository contains the Course Project for the Getting and Cleaning Coursera course.

### run_analysis.R

The script reproduces the steps performed in the project downloading and cleaning the data. For more information on the dataset please read the CodeBook file.

(Don't forget to set your working directory first)

```r
source('run_analysis.R')
run.analysis()
```

## Processing steps

1. Downloads UCI HAR Dataset into the working directory.
2. Reads the data into tow datasets for training and test data.
3. Merges the training and the test sets to create one dataset.
4. Extracts only the measurements on the mean and standard deviation for each measurement. 
5. Uses descriptive activity names to name the activities in the dataset.
6. Appropriately labels the data set with descriptive variable names.
7. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
8. Saves the resulting tidy dataset to disk.

