library(dplyr)

##Load files into tables 
xtrain              <- read.table("UCI HAR Dataset/train/X_train.txt")
ytrain              <- read.table("UCI HAR Dataset/train/y_train.txt")
subjecttrain        <- read.table("UCI HAR Dataset/train/subject_train.txt")
xtest               <- read.table("UCI HAR Dataset/test/X_test.txt")
ytest               <- read.table("UCI HAR Dataset/test/y_test.txt")
subjecttest         <- read.table("UCI HAR Dataset/test/subject_test.txt")

##Merges the training and the test sets to create one data set.
xcombinedData       <- rbind(xtrain, xtest)
ycombinedData       <- rbind(ytrain, ytest)
subjectcombinedData <- rbind(subjecttrain, subjecttest)

##Appropriately labels the data set with descriptive variable names.
colnames(subjectcombinedData)<-"subject"

activity_labels     <- read.table("UCI HAR Dataset/activity_labels.txt")
features            <- read.table("UCI HAR Dataset/features.txt")$V2

## remove - and () in the features names
features                <- gsub("\\-|\\(\\)", "", features)
## capitalize the first letter of Mean and Std 
##  so they are easily readable in lower camel case
features            <- gsub("mean", "Mean", features)
features            <- gsub("std", "Std", features)
## Make the t and f prefixes more descriptive
features            <- gsub("^t", "time", features)
features            <- gsub("^f", "frequency", features)
names(xcombinedData)<- features

##Extracts only the measurements on the mean and standard deviation for each measurement.
pattern             <- ".*(Mean|Std)$"
meanStdColumns      <- grep(pattern, names(xcombinedData))
xcombinedData       <- xcombinedData[meanStdColumns]

##Uses descriptive activity names to name the activities in the data set
activities          <- sapply(ycombinedData, function(x){activity_labels$V2[x]})

##Add the subject and activities to the mean and std measurements
colnames(activities)<- "activitylabel"
combinedData        <- cbind(activities, xcombinedData)
combinedData        <- cbind(subjectcombinedData, combinedData)

##  From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
userActivitySummary <- combinedData %>%
group_by(subject, activitylabel) %>%
summarise_each(funs(mean))