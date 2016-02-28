===============================
Creating the combinedData table
===============================
Data is extracted from files in the UCI HAR Dataset folder, if one does not exist in the current workspace it will be downloaded to the current working directory

The training set and the test set is loaded into tables that reflect the source file name minus underscores and file extension

The training set and the test set are then merged, which includes merging columns for the activity and subject columns to align to their respective observations in x feature values

Column names are manually applied to the subject and activitylabel values, and applied to the x features from the "features" file in the original data set.  
Furthermore the x features are manipulated to be more tidy, including removing math operators "-" and "()", replacing the "t" and "f" prefixes to what they stand for (time and frequency)
and the postfixes mean and std have their first letter capitalized to Mean and Std to be easier to read as consitant lower camel case

The original values for the y data was a numeric value corresponding to activity type, the integers are turned into factors that are mapped from the integer to a string value in features.txt
This makes the values of the "activityLabel" a descriptive, such as "SITTING" or "WALKING" 

A table is created called combinedData that combines the columns for each observations subject (from the subject text files), the activitiy labels (see above) 
and the mean and standard deviation values from combined x train and test features

================================
Creating the userActivitySummary 
================================
The feature values are then grouped by subject ID and activity label and features are averaged for each group and saved to the table userActivitySummary

See Codebook.MD for full column descriptions 

==============
Tables created
===============
userActivitySummary 
combinedData - A tidied dataset that combines data from the UCI HAR Dataset in a meaningful way (see above)

xtrain 		- table with the UCI HAR Dataset/train/x_train.txt values (the feature values)
ytrain 		- table with the UCI HAR Dataset/train/y_train.txt values (the activity label indices)             
subjecttrain 	- table with the UCI HAR Dataset/train/subject_train.txt values (the subject ids)
xtest           - table with the UCI HAR Dataset/test/x_test.txt values (the feature values)    
ytest		- table with the UCI HAR Dataset/test/y_test.txt values (the activity label indices) 
subjecttest 	- table with the UCI HAR Dataset/test/subject_test.txt values (the subject ids)

