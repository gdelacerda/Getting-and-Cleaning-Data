Code Book - Getting and Cleaning Data Project
========================================================

## Executive Summary

This file contains the  _Getting and Cleaning Data_ project description.  The main purpose of this analysis is to generate a tidy data with the averages of a number of variables provided from a set consisting in separate files for training and test sets of data . The next sections provide a brief description of the Input Data, the transformation of the Input data and the final results.

## Input Data Description

The Input Data was extracted from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip . This data provides the information about an experiment of human activity recognition using smartphones. All the details about the experiment and data can be found in the site: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.

In summary the input data is divided in a training set and in a training set. There are various components of the data which are in separate files.


## Analysis Introduction

The analysis for this assignment  using the Input data set consists in transforming this data which has been described in the previous section and compute the averages of the variables in this data. As mentioned, the Input Data is divided in two sets: the training and testing sets. At the same time the training and testing sets have various componenets in different files like the activity carried out for each observation/record and the variable that contains the individual/subject who carried out the activity is on a different file.

In order to compute the average of each variable for each activity and each subject, we must put all the variables (activity and individual) together with the training and test sets and put merge the training and testing sets to come up with a single set. 


## Merging and Transforming the Input Data 

 **1. merge.R  - merges the training and the test sets to create one data set**

 Given the explanation of the input data the training and test sets have the same number of columns /variables and follow the same order, thus we can be confident to make a vertical (row) merge. 

 The merge function takes the name of the files with the training (X_train.txt) and testing (X_test.txt) data and outputs a merged data. The merge is done using the rbind command to merge the sets and assumes that the number of columns is the same in both sets and follow the same order. So if the sets do not have the same number of columns it will throw an error and will not proceed with the merge. If the training set is of dimension n x K and the dimensions of the testing set is m x K we expect to have a merged Data Set with dimensions (n+m) x K, otherwise an error will be produced.
 
 **2. extractMeanStDev.R - extracts only the measurements on the mean and standard deviation for each measurement**
 
 This function takes a data set, for instance the merged data set obtain in step 1 and extracts only the measurements that estimate mean and standard deviation which according to features_info.txt and features.txt are all those variables containing the "-mean() and "-std()" strings. 

 **3. namingActivities.R - uses descriptive activity names to name the activities in the data set**

 This function takes the activity labels and activity files for training and testing (y_train.txt and y_test.txt) and returns a single vector with the activity names (labels) corresponding to the training and testing activities using qdapTools library which performs a vlookup like in Microsoft Excel.
 
 
 **4. setVariableNamestoData.R - labels the data set with descriptive variable names**
 
 This function tags the variables with the respective variable name. The variable names are not given within the training and testing sets but they are on separate files so this function takes  file and dataSet and the features.txt to produce a set with column names.
 
  **5. run_analysis.R - create an independent tidy data set with the average of each variable for each activity and each subject**
  
  This function puts all the previous scripts together, it takes the train data file, test data file, activity files, features file and subject files in the following order: 
  
  Y_train.txt
  Y_test.txt
  features.txt
  activity_labels.txt
  y_train.txt
  y_text.txt
  subject_train.txt
  subject_test.txt
  
 This script merged the train and test sets, labels the activities with the corresponding names, reads  the subject train and test files and merge them together to make a single table containing the subjects of the train and test sets. 
 
 The vector of activity names  obtained with  namingActivities.R and the vector of subjects is added to the merged data to come up with a data set that contains all the original columns plus the Activity and Subject columns. With this data set we can filter or subset the data by Activity and Subject so that we can compute the means of all the variables and store these means on a separate data set.
 
## Output Data - the tidy Data Set with avergae of each variable

The resulting data set is a set with the same number of columns/ variables (561) as the original train and test sets and an additional column which indicates the subject and the activity: 

Subject_Activity: Is a variable which indicates the subject who performed the activity and the activity name.

The rest of variables/features already described in the input data set are the averages of the input variable values corresponding to a certain activity and certain subject.

 

 
 