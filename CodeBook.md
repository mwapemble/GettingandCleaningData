---
title: "CodeBook.md"
output: html_document
---

# Basics
<p>Code Book file for the course project for the Johns Hopkins "Getting and Cleaning Data" Coursera course.
<p>Author: Matthew Pemble
<p>Course: 3 Aug 15 (getdata-031)

# run_analysis.R

<p>This script is designed to run against the </P>
## Human Activity Recognition Using Smartphones Data Set
citation: Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. A Public Domain Dataset for Human Activity Recognition Using Smartphones. 21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning, ESANN 2013. Bruges, Belgium 24-26 April 2013.
[link to original dataset](archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

## Grouping Variables
1. As required in the project specification.
* activity
* subject

## Mean and Standard Deviation Variables.
1. These 79 variables were extracted from the 561 variables in the original data set as being the ones holding the mean and standard deviation on each measurement.
1. The rows contain the mean values for each measurement, grouped by the activity and subject grouping variables above.
1. Names have been expanded in accordance with the project specification.

* timebodyaccelerationmeanX
* timebodyaccelerationmeanY
* timebodyaccelerationmeanZ
* timebodyaccelerationstandarddeviationX
* timebodyaccelerationstandarddeviationY 
* timebodyaccelerationstandarddeviationZ
* timegravityaccelerationmeanX
* timegravityaccelerationmeanY 
* timegravityaccelerationmeanZ
* timegravityaccelerationstandarddeviationX
* timegravityaccelerationstandarddeviationY
* timegravityaccelerationstandarddeviationZ
* timebodyaccelerationjerkmeanX
* timebodyaccelerationjerkmeanY
* timebodyaccelerationjerkmeanZ
* timebodyaccelerationjerkstandarddeviationX"	
* timebodyaccelerationjerkstandarddeviationY
* timebodyaccelerationjerkstandarddeviationZ
* timebodygyromeanX
* timebodygyromeanY
* timebodygyromeanZ
* timebodygyrostandarddeviationX
* timebodygyrostandarddeviationY
* timebodygyrostandarddeviationZ
* timebodygyrojerkmeanX
* timebodygyrojerkmeanY
* timebodygyrojerkmeanZ
* timebodygyrojerkstandarddeviationX
* timebodygyrojerkstandarddeviationY
* timebodygyrojerkstandarddeviationZ
* timebodyaccelerationmagnitudemean
* timebodyaccelerationmagnitudestandarddeviation
* timegravityaccelerationmagnitudemean
* timegravityaccelerationmagnitudestandarddeviation
* timebodyaccelerationjerkmagnitudemean
* timebodyaccelerationjerkmagnitudestandarddeviation
* timebodygyromagnitudemean
* timebodygyromagnitudestandarddeviation
* timebodygyrojerkmagnitudemean
* timebodygyrojerkmagnitudestandarddeviation
* frequencybodyaccelerationmeanX
* frequencybodyaccelerationmeanY
* frequencybodyaccelerationmeanZ
* frequencybodyaccelerationstandarddeviationX
* frequencybodyaccelerationstandarddeviationY
* frequencybodyaccelerationstandarddeviationZ
* frequencybodyaccelerationmeanfrequencyX
* frequencybodyaccelerationmeanfrequencyY
* frequencybodyaccelerationmeanfrequencyZ
* frequencybodyaccelerationjerkmeanX
* frequencybodyaccelerationjerkmeanY
* frequencybodyaccelerationjerkmeanZ
* frequencybodyaccelerationjerkstandarddeviationX
* frequencybodyaccelerationjerkstandarddeviationY
* frequencybodyaccelerationjerkstandarddeviationZ
* frequencybodyaccelerationjerkmeanfrequencyX
* frequencybodyaccelerationjerkmeanfrequencyY
* frequencybodyaccelerationjerkmeanfrequencyZ
* frequencybodygyromeanX
* frequencybodygyromeanY
* frequencybodygyromeanZ
* frequencybodygyrostandarddeviationX
* frequencybodygyrostandarddeviationY
* frequencybodygyrostandarddeviationZ
* frequencybodygyromeanfrequencyX
* frequencybodygyromeanfrequencyY
* frequencybodygyromeanfrequencyZ
* frequencybodyaccelerationmagnitudemean
* frequencybodyaccelerationmagnitudestandarddeviation
* frequencybodyaccelerationmagnitudemeanfrequency
* frequencybodyaccelerationjerkmagnitudemean
* frequencybodyaccelerationjerkmagnitudestandarddeviation
* frequencybodyaccelerationjerkmagnitudemeanfrequency
* frequencybodygyromagnitudemean
* frequencybodygyromagnitudestandarddeviation
* frequencybodygyromagnitudemeanfrequency
* frequencybodygyrojerkmagnitudemean
* frequencybodygyrojerkmagnitudestandarddeviation
* frequencybodygyrojerkmagnitudemeanfrequency	

## Angle variables
1. These clearly refer to mean measurements therefore were left in rather than omitted.
2. It is noted that there is no standard deviation for these measurements.

* angle(timebodyaccelerationmean,gravity)
* angle(timebodyaccelerationjerkmean,gravitymean)
* angle(timebodygyromean,gravitymean)
* angle(timebodygyrojerkmean,gravitymean)
* angle(X,gravitymean)
* angle(Y,gravitymean)
* angle(Z,gravitymean)