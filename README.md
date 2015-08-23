---
title: "README.md"
output: html_document
---

# Basics
<p>README file for the course project for the Johns Hopkins "Getting and Cleaning Data" Coursera course.
<p>Author: Matthew Pemble
<p>Course: 3 Aug 15 (getdata-031)

# run_analysis.R

<p>This script is designed to run against the </P>
## Human Activity Recognition Using Smartphones Data Set
citation: Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. A Public Domain Dataset for Human Activity Recognition Using Smartphones. 21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning, ESANN 2013. Bruges, Belgium 24-26 April 2013.
[link to original dataset](archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

## Initialisation Routines
1. Check for the dplyr library and load if not already available.
2. Initialise the variables.
+ This was initially intended to allow the function to run as a generic function.
+ That became too much like hard work but you can see the traces in the program structure.

## Directory and file management
3. Check that the data directory exists 
+ if not, make it.
4. Check to see that the downloaded file exists
+if not, download it 
+ using the libcurl method because I'm running this on OSX.
5. Unzip the file.
6. Get the file names.
7. Discard the file names that are not used. (Clearly a generic remnant!)
8. Load the files into individual tables.

## Merges the training and the test sets to create one data set.
9. Check that there are the same number of columns in the training and test data sets.
10. Using the rbind function, merge each of the three table pairs.
+ "activities" and "labels" are cover both sets.

## Extracts only the measurements on the mean and standard deviation for each measurement. 
11. Subset the labels table to lose the row numbers.
12. Use grepl to extract a logical list of labels which contain the terms "Mean", "mean" or "std".
13. Subset the labels table with the logical list.

## Uses descriptive activity names to name the activities in the data set
14. Run a series of greps to generate descriptive names following the tidy rules
+ All lower case.
+ Expand abbreviations
+ No periods or underscores
15. Remove the "BodyBody" repeat.
16. Note that the X, Y and Z axis names were deliberately left in capitals.
+ Because maths!
17. Remove the brackets and hypens.

## Extracts only the measurements on the mean and standard deviation for each measurement.
18. Simple subset on the labels.wanted list established at 12 above.
19. Use the colnames function on each of the tables.

## From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
20. Merge the tables using colbind.
21. Group the data using the aggregate function (dplyr) by activity and subject using the mean function.
22. Drop the two meaningless columns (the means of the grouping variables), right-hand first for sense (tidy.data[3] <- NULL repeated would also work but would be less clear.)

## Appropriately labels the data set with descriptive variable names.
23. Use the "activities" table to replace the numeric values in the activities column.
24. Check to see if the output directory exists.
25. Write the table as a tab separated text file.


