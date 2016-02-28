Study design

The data was collected from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The orginal collected data is described here http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

A summary from the site

Data Set Information:

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 
The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

Code book

 subject - An identifier of which person was doing the activity
 activitylabel - This is a factor representing the activity the observation is described "LAYING", "SITTING", "STANDING", "WALKING", "WALKING_DOWNSTAIRS", "WALKING_UPSTAIRS" 

 9 measurement types, each with mean and standard deviation (below), 
 The values based on Means are denoted to be named with Mean at the end, Std for Standard deviation
 These values are derived from the means and standard deviations in the original data that represented the mean and standard deviations for a reading over an observation
 Each value below is taken from those original mean and std deviation values from the average of each variable for each activity and each subject.
 
 timeBodyAccMagMean, 				timeBodyAccMagStd          
 timeGravityAccMagMean, 			timeGravityAccMagStd       
 timeBodyAccJerkMagMean, 			timeBodyAccJerkMagStd
 timeBodyGyroMagMean, 				timeBodyGyroMagStd
 timeBodyGyroJerkMagMean, 			timeBodyGyroJerkMagStd
 frequencyBodyAccMagMean, 			frequencyBodyAccMagStd
 frequencyBodyBodyAccJerkMagMean, 	frequencyBodyBodyAccJerkMagStd
 frequencyBodyBodyGyroMagMean, 		frequencyBodyBodyGyroMagStd
 frequencyBodyBodyGyroJerkMagMean, 	frequencyBodyBodyGyroJerkMagStd

