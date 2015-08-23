## run_analysis.R
## R Script for the course project for the
## Johns Hopkins "Getting and Cleaning Data"
## Coursera course.
## Author: Matthew Pemble
## Course: 3 Aug 15 (getdata-031)

## Merges the training and the test sets to create one data set.
## Extracts only the measurements on the mean and standard deviation for each measurement. 
## Uses descriptive activity names to name the activities in the data set
## Appropriately labels the data set with descriptive variable names. 
## Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Initialisation Routines
if (!require(dplyr)){
  install.package("dplyr")}
require(dplyr)

## Initialise variables. These could be parameters in a generic function
data.directory <- "data"
tidy.directory <- "tidy"
zipfile <- "wearables.zip"
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "
files.used <- c(1, 3, 14, 15, 16, 26, 27, 28)

## Check to see if there is a data directory
## If not, create it.
if (!file.exists(data.directory)) {
  dir.create(data.directory)
}

## Fetch file if not already downloaded
tempname <- paste(".", data.directory, zipfile, sep="/")
if (!file.exists(tempname)) 
  {
  ## Running on Mac / OSX & target is https, therefore "libcurl" method is required.
  download.file(fileUrl, destfile = tempname, method = "libcurl")
  dateDownloaded.zip <- date()
}

  ## Extract files from zip archive
unzip(tempname, exdir = data.directory)

## Collect files
file.names <- paste(data.directory,list.files(data.directory, recursive=TRUE),sep="/")
## Discard unused files
file.names <- file.names[files.used]

## Load files in to tables.
activities <- read.table(file.names[1], header = FALSE)
labels <- read.table(file.names[2], header = FALSE)

test.subject <- read.table(file.names[3], header = FALSE)
test.features <- read.table(file.names[4], header = FALSE)
test.activity <- read.table(file.names[5], header = FALSE)
  
train.subject <- read.table(file.names[6], header = FALSE)
train.features <- read.table(file.names[7], header = FALSE)
train.activity <- read.table(file.names[8], header = FALSE)

## Merges the training and the test sets to create one data set.

if (ncol(test.features) != ncol(train.features)) {
  stop("Number of columns is different in input files!")
}
features <- rbind(test.features, train.features)
activity <- rbind(test.activity, train.activity)
subject <- rbind(test.subject, train.subject)

## Extracts only the measurements on the mean and standard deviation for each measurement. 

labels <- labels[,2]
labels.wanted <- grepl("[Mm]ean|std", labels)
label.names <- labels[labels.wanted]

## One by one modify the names to be meaningful
## And to meet the "tidy data" specs.
## Deliberately leaving capital X, Y & Z
label.names <- gsub("[Mm]ean","mean", label.names)
label.names <- gsub("std","standarddeviation", label.names)
label.names <- gsub("Body(Body)?","body", label.names)
label.names <- gsub("^t", "time", label.names)
label.names <- gsub("(^f)|[Ff]req", "frequency", label.names)
label.names <- gsub("Acc","acceleration", label.names)
label.names <- gsub("Mag","magnitude", label.names)
label.names <- gsub("tbody", "timebody", label.names)
label.names <- gsub("G", "g", label.names)
label.names <- gsub("J", "j", label.names)

## Remove superfluous characters 
label.names <- gsub("-|(\\(\\))","",label.names)

## And now extract the wanted columns
features <- features[,labels.wanted]

## Appropriately labels the data set with descriptive variable names. 
colnames(activity) <- "activity"
colnames(subject) <- "subject"
colnames(features) <- label.names

## Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## merge data in to single data frame
complete.data <- cbind(activity, subject, features)
## generate means by subject and activity
tidy.data <- aggregate(complete.data, by=list(activity = complete.data$activity, subject=complete.data$subject), mean)
## remove meaningless columns (means of group variables)
tidy.data[4] <- NULL
tidy.data[3] <- NULL
  
## Uses descriptive activity names to name the activities in the data set
tidy.data$activity <- activities[tidy.data$activity,2]
## Export data as tidy/meansbysubjectandactivity.txt
## First make directory

if (!file.exists(tidy.directory)) {
  dir.create(tidy.directory)
}
## Then write file
tempname <- paste(tidy.directory,"meansbysubjectandactivity.txt", sep="/")
write.table(tidy.data,tempname,sep="\t",row.names=FALSE)

                        