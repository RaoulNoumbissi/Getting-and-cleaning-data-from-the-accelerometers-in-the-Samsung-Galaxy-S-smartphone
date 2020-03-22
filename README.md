# Getting-and-cleaning-data-from-the-accelerometers-in-the-Samsung-Galaxy-S-smartphone

#Objective
The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.

#Data Description
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data

#File Descrition
 -run_analysis.R
This file contains the analysis conducted for this study. 
 .Import the necessary files
 .Create the data frames from the imported files
 .Merge The data frames and select the required features to obtain a tidy dataset
 .Create a new data frame that contains the average of all the variables by subject, by activity.
 
 -Codebook.md
  Provide a detailed dscription of the files, variables and functions used in this study.
 
  - by_Subject_by_Activity.txt
  The text file that contains the tidy data set for this study.
   . 180 observations that represent the subjects for this study with number tranging from 1 to 30
   . 68 columns. 1 column for subject, 1 column for activity, 66 columns for the average of each variables for each subject and for each      activity

