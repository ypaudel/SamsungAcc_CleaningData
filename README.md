## INTRODUCTION

This document describes the processes used in interpreting, cleaning and processing the motion data collected from Samsung Galaxy S Smarthones. In the programming assignment for "Getting and Cleaning Data"- a coursera class from John Hopkins, the given dataset was downloaded and placed in the R working directory. The data was then read into R using read.table and various functions were applied to merge tables, apply header names, create a new column with descreptive variable names for activity, and finally create a data frame for means of all variables, for each subject ID and activity type.

## Running Analysis

To successfully use the run_analysis script included in this repo, it is assumed that you have the required dataset ("UCI HAR Dataset" directory, in your R working directory. If not, the file locations in step 1 of the script should be changed accordingly for the code to be able to access the proper data.

