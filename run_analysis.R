library(dplyr)

combineUCIHARData <- function()
{
    datasetDirectory <- "UCI HAR Dataset"
    ##if the dataset folder is not present in the current working directory fetch it
    if (!file.exists(datasetDirectory))
    {
        download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip")
    }
    
    ##Load files into tables 
    xtrain              <- read.table("UCI HAR Dataset/train/X_train.txt")
    ytrain              <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "activityLabel")
    subjecttrain        <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
    xtest               <- read.table("UCI HAR Dataset/test/X_test.txt")
    ytest               <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "activityLabel")
    subjecttest         <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
    
    ##Merges the training and the test sets to create one data set.
    xcombinedData       <- bind_rows(xtrain, xtest)
    ycombinedData       <- bind_rows(ytrain, ytest)
    subjectcombinedData <- bind_rows(subjecttrain, subjecttest)
    
    ##Appropriately labels the data set with descriptive variable names.
    activitylabels      <- read.table("UCI HAR Dataset/activity_labels.txt")
    features            <- read.table("UCI HAR Dataset/features.txt")$V2
    
    ## remove - and () in the features names
    features            <- gsub("\\-|\\(\\)", "", features)
    ## capitalize the first letter of Mean and Std 
    ##  so they are easily readable in lower camel case
    features            <- gsub("mean", "Mean", features)
    features            <- gsub("std", "Std", features)
    ## Make the t and f prefixes more descriptive
    features            <- gsub("^t", "time", features)
    features            <- gsub("^f", "frequency", features)
    names(xcombinedData)<- make.names(names=features, unique=TRUE)
    
    ##Extracts only the measurements on the mean and standard deviation for each measurement.
    pattern             <- ".*(Mean|Std)$"
    xcombinedData       <- select(xcombinedData, matches(pattern))
    
    combinedData        <- bind_cols(list(subjectcombinedData, activityLabel=ycombinedData, xcombinedData))
    
    ##Uses descriptive activity names to name the activities in the data set
    bind_cols(subjectcombinedData, 
                mutate(ycombinedData, activityLabel=activitylabels$V2[activityLabel]), 
                xcombinedData)
}

combinedDataSet <- combineUCIHARData()

##  From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
userActivitySummary <- combinedDataSet %>%
group_by(subject, activityLabel) %>%
summarise_each(funs(mean))

write.table(userActivitySummary, file="output.txt", row.names = FALSE)