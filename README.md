##README for Getting and Cleaning Data Course Assignment

###Downloading and Unzipping Data

Prior to running the run_analysis.R script, make sure to complete the following steps:

* Download the data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.
* Unzip the file and save the data into your working directory.
* Install the "qdap" package to allow for easy lookup of activity names in Step 3.

The run_analysis.R file assumes that the contents of the UCI HAR Dataset folder are saved within the working directory.  For example, your working directory should include the test folder, the train folder, and text files for features.txt and activity_labels.txt.

###Overview of R Script

The R script was created using R version 3.1.1 (64 bit) on Windows 8.1.

In order to complete the steps identified in the course assignment, the run_analysis.R file imports the following files:
* Test and training data sets (X_test.txt and X_train.txt, from respective folders)
* Subject numbers (subject_test.txt and subject_train.txt, from respective folders)
* Activity numbers (Y_test.txt and Y_train.txt, from respective folders)
* Variable labels from features.txt
* Activity labels from activity_labels.txt

The R script uses colnames to add the variable labels and cbind to add the subject and activity numbers to each data set.

Next, the script completes the steps identified in the course assignment:

* Step 1 - Merges the test and training data (using rbind).
* Step 2 - Extracts only the mean and standard deviation for each measurement (using grep).  The regular expression includes variables with "Mean", "mean", or "std" included anywhere in the variable name.  This results in 86 variables.
* Step 3 - Replaces activity numbers with descriptive activity names (using lookup from the qdap package).
* Step 4 - Appropriately labels the data set with descriptive variable names (using gsub).  This step searches for and substitutes technical names and abbreviations with more human-readable text.  For example, "tBodyAcc-std()-X" is updated to become "Time Body Acceleration Standard Deviation X Axis".
* Step 5 - Creates a tidy data set with the average of each variable for each combination of subject and activity (using aggregate).  The resulting data set reflects a "wide" format for tidy data, as outlined on the course discussion forum: 
https://class.coursera.org/getdata-007/forum/thread?thread_id=214#comment-672.  It adheres to tidy data principles, where each variable forms its own column and each combination of subject and activity forms its own row.

Finally, the R script uses write.table to export the tidy data set from Step 5 to mean_std_summary.txt.  Once saved to your working directory, this file may be imported into R using the following code:

import <- read.table("mean_std_summary.txt", header=TRUE)









