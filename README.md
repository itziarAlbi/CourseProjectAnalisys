==================================================================
Course Project- Getting and Cleaning Data
Version 1.0

This repo explains how all the documents work and how they are connected.

R script: run_analisys.R

CodeBook.md: describes all variables that take part in output file. 


Usage: The script is divided into smaller functions where main function is called run().
To run the script type simply: run()

All files must be included in root directory "./UCI HAR Dataset".

First my script checks if directory "./UCI HAR Dataset" exits and the subdirectories "train" and "test". If don't exist, it throws an error with information message and script stops.

Secondly it reads train and test files and merges testing data frame with training data frame. It creates a data frame built by 10299 rows and 563 columns.

And renames default columns (V1, V2 ... etc.) as features.txt, except for "Subjects", "Types" and "Activities" columns.
Then, extracts mean and standard deviation columns for each measurement, running column names, and if the column name has the pattern "mean()" or "std()", it retrieves the index. So the new data frame has 10299 rows and 69 columns. 
Afterwards, uses activity names described in activity_label.txt file to name the activities in the data set (1 is Walking and so on).

It sets appropriately labels to the data set with descriptive variable names. Replaces _X, _Y or _Z by .X, .Y and .Z, replaces tBody by Time.Body and tGravity by Time.Gravity, replaces fBody by Frequency.Body and fGravity by Frequency.Gravity, replaces -mean by .Mean and -std by .StdDvt and replaces "()" by a blank.
Using aggregate() command it calculates the average of each variable for each activity and each subject. Besides, the script sorts data frame by Subject and Activity columns ascending.
Finally it writes output in a text file named "result.txt".
