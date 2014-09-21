 Getting and Cleaning Data Project - Structure
========================================================


This is the list of R files in this repository:
-----------------------------------------------

1. run_analysis.R - this file contains the main analysis and will produce a tidy data set containing the averages of the variables as requested.

The rest of the script files are functions used in the run_analysis.R to produce the tidy data. They are  in separate files to make the explanation easier of 
each step in the process of merging and tidying the data.

2. merge.R
3. extractMeanStDev.R
4. namingActivities.R 
5. setVariableNamestoData.R 

CodeBook.md
--------------

The CodeBook.md gives a brief explanation about each of these R scripts and the interaction with the  run_analysis.R, the parameter inputs and outputs of each script.

Tidy DataSet
--------------

The TidyDataSet.txt is the tidy data set with the average of each variable for each activity and each subject. This data is explained in the CodeBook.md as well