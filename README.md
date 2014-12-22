Getting and cleaning data course project:
=========================

Project for the Coursera course "Getting and cleaning data"!
The run_analysis.R reads the data from the directory "UCI HAR Dataset". Once you have this directory in your work directory, The code will do the analysis on the data files and gives back a data set named: "MeanValues.txt" which includes the average values of mean and std measurements for each subject and activity in the original data set.

# How the code works

* In order to run the code, one first put the directory including the data in the work directory. For that, one should download the .zip file from the url:
  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
* Unzip the downloaded data.
* The Code first reads the data files from the "UCI HAR Dataset" directory placed in the work directory.
* Then Merges the training and test data set to build a big data set including all the results merged to gether.
* At tihs step the code exracts only the measurements on the mean and standard deviation for each measurement.
* Then usex the discriptive activity names to name the activities in the data set.
* At this step the code appropriately labels the data set with descriptive variable names. 
* Finally it writes the tidy data set with the average of each variable for each activity and each subject.
