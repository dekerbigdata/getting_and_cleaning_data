Codebook
==============================================================


## Data

The orginal data from UCI Machine Learning Repository is the Human Activity Recognition Using Smartphones Data Set. 

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. 

### Raw dataset

- [Human Activity Recognition Using Smartphones Data Set](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip ) 

### Merged and intemideate datasets

The training and test datasets are combined to produce a merged dataset.

This merged dataset cotains 10299 observations of 563 variables.

First we select only the observations related to the mean or std of the variables by applying regexp ('-mean()|-str()')

This produces an intermediate dataset of 68 variables.

### Tidy dataset

Tidy dataset contains the average of all variables of the intermediate dataset. 

Variable names were modified in the follonwing way:

 1. Replaced -mean with Mean
 2. Replaced -std with Std
 3. Removed parenthesis -()
 4. Replaced t with Time 
 5. Replaced f with Freq 
