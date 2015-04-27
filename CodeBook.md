#Code Book for the Course Project of Getting and Cleaning Data

##Project Description
The project is aim to get tidy data set from raw data collected during the Human Activity Recognition Using Smartphones experiments. The raw data were divided into two data sets, the training and testing ones. The task of the Course Project is to merge the raw data into one file [tidy.txt](tidy.txt), provide the descriptive names for its content and select certain columns of data for future exploration.  

##Collection of the raw data
According to the [description of the research](resources/README.txt), the experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, the reserches captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz.

The complete list of variables thus obtaine contains **561 element**. Is is available in [features.txt](resources/features.txt)

##Creating the tidy datafile

For the creation of tidy datafile R script called `run_analysis.R` is written. Find out [how does the script work](README.md).


