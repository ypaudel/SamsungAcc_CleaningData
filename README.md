## INTRODUCTION

This document breifly describes the processes used in interpreting, cleaning and processing the motion data collected from Samsung Galaxy S Smarthones. 

In the programming assignment for "Getting and Cleaning Data"- a coursera class from John Hopkins, the given dataset was downloaded and placed in the R working directory. The data was then read into R using read.table and various functions were applied to merge tables, apply header names, create a new column with descreptive variable names for activity, and finally create a data frame for means of all variables, for each subject ID and activity type.

## Running Analysis

1. To successfully use the run_analysis script included in this repo, it is assumed that you have the required dataset ("UCI HAR Dataset" directory, in your R working directory. If not, the file locations in step 1 of the script should be changed accordingly for the code to be able to access the proper data.


## Reading the Data file in R
Use read.table() function to read into R. Again, it is assumed the data is in the working directory.
Make sure to use arguments header=TRUE and stringsAsFactors=FALSE to get the proper reading.

## REFERENCE
[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

## ORIGINAL DATA SOURCE
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## DATA FOR RUNNING ANALYSIS ALTERNATE SOURCE
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 