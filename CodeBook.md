##Code Book for Getting and Cleaning Data Course Assignment

###Data Source

The data source for this analysis is the Human Activity Recognition Using Smartphones Data Set.  The data were downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip on September 8, 2014.

Citation Info:  Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012.

###Study Design

The description of the data available at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones indicates that:

"The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy SII) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data."

###Data Files

The relationships between the various files are described in the README.txt file included within the downloaded data.  The following files were imported and used for this assignment:  
* Test and training data sets (X_test.txt and X_train.txt, from respective folders)
* Subject numbers (subject_test.txt and subject_train.txt, from respective folders)
* Activity numbers (Y_test.txt and Y_train.txt, from respective folders)
* Variable labels from features.txt
* Activity labels from activity_labels.txt

A variety of R tools were utilized to combine data files for future analysis.  The R script was created using R version 3.1.1 (64 bit) on Windows 8.1.  

The R script uses colnames to add the variable labels and cbind to add the subject and activity numbers to each data set.  The test and training data were then merged using rbind to create one data set.

Activity numbers were replaced with descriptive activity names, using a lookup to the activity_labels file.

###Variables

The features.txt file includes a list of all 561 time and frequency variables included within the original data.  The features_info.txt file includes additional detail on variable measurement and calculation:
* Time domain variables come from the embedded accelerometer and gyroscope across 3 axes (X,Y,Z) and were captured at a constant rate of 50 Hz
* The acceleration signal was then separated into body and gravity acceleration signals
* Body linear acceleration and angular velocity were derived in time to obtain Jerk signals
* The magnitude of these signals were calculated using the Euclidean norm
* A Fast Fourier Transform was applied to produce frequency domain variables

Units of Measurement:  As noted within the README.txt file included with the downloaded data, all variables are normalized and are bounded within [-1,1].  Because variables are normalized, the original units of measurement cancel out.

Selected Variables:  grep was used to extract variables with "Mean", "mean", or "std" included anywhere in the variable name. This results in 86 remaining variables.  All other variables were excluded from the final data set.

Variable Name Changes:  gsub was used to search for and substitute technical names and abbreviations with more descriptive
text.  For example, "tBodyAcc-std()-X" is updated to become "Time Body Acceleration Standard Deviation X Axis".  The following list outlines the descriptive variable names in the final data set and the original name of the data represented:

* Time Body Acceleration Mean X Axis <<-- tBodyAcc-mean()-X
* Time Body Acceleration Mean Y Axis <<-- tBodyAcc-mean()-Y
* Time Body Acceleration Mean Z Axis <<-- tBodyAcc-mean()-Z
* Time Body Acceleration Standard Deviation X Axis <<-- tBodyAcc-std()-X
* Time Body Acceleration Standard Deviation Y Axis <<-- tBodyAcc-std()-Y
* Time Body Acceleration Standard Deviation Z Axis <<-- tBodyAcc-std()-Z
* Time Gravity Acceleration Mean X Axis <<-- tGravityAcc-mean()-X
* Time Gravity Acceleration Mean Y Axis <<-- tGravityAcc-mean()-Y
* Time Gravity Acceleration Mean Z Axis <<-- tGravityAcc-mean()-Z
* Time Gravity Acceleration Standard Deviation X Axis <<-- tGravityAcc-std()-X
* Time Gravity Acceleration Standard Deviation Y Axis <<-- tGravityAcc-std()-Y
* Time Gravity Acceleration Standard Deviation Z Axis <<-- tGravityAcc-std()-Z
* Time Body Acceleration Jerk Signal Mean X Axis <<-- tBodyAccJerk-mean()-X
* Time Body Acceleration Jerk Signal Mean Y Axis <<-- tBodyAccJerk-mean()-Y
* Time Body Acceleration Jerk Signal Mean Z Axis <<-- tBodyAccJerk-mean()-Z
* Time Body Acceleration Jerk Signal Standard Deviation X Axis <<-- tBodyAccJerk-std()-X
* Time Body Acceleration Jerk Signal Standard Deviation Y Axis <<-- tBodyAccJerk-std()-Y
* Time Body Acceleration Jerk Signal Standard Deviation Z Axis <<-- tBodyAccJerk-std()-Z
* Time Body Gyroscope Mean X Axis <<-- tBodyGyro-mean()-X
* Time Body Gyroscope Mean Y Axis <<-- tBodyGyro-mean()-Y
* Time Body Gyroscope Mean Z Axis <<-- tBodyGyro-mean()-Z
* Time Body Gyroscope Standard Deviation X Axis <<-- tBodyGyro-std()-X
* Time Body Gyroscope Standard Deviation Y Axis <<-- tBodyGyro-std()-Y
* Time Body Gyroscope Standard Deviation Z Axis <<-- tBodyGyro-std()-Z
* Time Body Gyroscope Jerk Signal Mean X Axis <<-- tBodyGyroJerk-mean()-X
* Time Body Gyroscope Jerk Signal Mean Y Axis <<-- tBodyGyroJerk-mean()-Y
* Time Body Gyroscope Jerk Signal Mean Z Axis <<-- tBodyGyroJerk-mean()-Z
* Time Body Gyroscope Jerk Signal Standard Deviation X Axis <<-- tBodyGyroJerk-std()-X
* Time Body Gyroscope Jerk Signal Standard Deviation Y Axis <<-- tBodyGyroJerk-std()-Y
* Time Body Gyroscope Jerk Signal Standard Deviation Z Axis <<-- tBodyGyroJerk-std()-Z
* Time Body Acceleration Magnitude Mean <<-- tBodyAccMag-mean()
* Time Body Acceleration Magnitude Standard Deviation <<-- tBodyAccMag-std()
* Time Gravity Acceleration Magnitude Mean <<-- tGravityAccMag-mean()
* Time Gravity Acceleration Magnitude Standard Deviation <<-- tGravityAccMag-std()
* Time Body Acceleration Jerk Signal Magnitude Mean <<-- tBodyAccJerkMag-mean()
* Time Body Acceleration Jerk Signal Magnitude Standard Deviation <<-- tBodyAccJerkMag-std()
* Time Body Gyroscope Magnitude Mean <<-- tBodyGyroMag-mean()
* Time Body Gyroscope Magnitude Standard Deviation <<-- tBodyGyroMag-std()
* Time Body Gyroscope Jerk Signal Magnitude Mean <<-- tBodyGyroJerkMag-mean()
* Time Body Gyroscope Jerk Signal Magnitude Standard Deviation <<-- tBodyGyroJerkMag-std()
* Frequency Body Acceleration Mean X Axis <<-- fBodyAcc-mean()-X
* Frequency Body Acceleration Mean Y Axis <<-- fBodyAcc-mean()-Y
* Frequency Body Acceleration Mean Z Axis <<-- fBodyAcc-mean()-Z
* Frequency Body Acceleration Standard Deviation X Axis <<-- fBodyAcc-std()-X
* Frequency Body Acceleration Standard Deviation Y Axis <<-- fBodyAcc-std()-Y
* Frequency Body Acceleration Standard Deviation Z Axis <<-- fBodyAcc-std()-Z
* Frequency Body Acceleration Mean Frequency X Axis <<-- fBodyAcc-meanFreq()-X
* Frequency Body Acceleration Mean Frequency Y Axis <<-- fBodyAcc-meanFreq()-Y
* Frequency Body Acceleration Mean Frequency Z Axis <<-- fBodyAcc-meanFreq()-Z
* Frequency Body Acceleration Jerk Signal Mean X Axis <<-- fBodyAccJerk-mean()-X
* Frequency Body Acceleration Jerk Signal Mean Y Axis <<-- fBodyAccJerk-mean()-Y
* Frequency Body Acceleration Jerk Signal Mean Z Axis <<-- fBodyAccJerk-mean()-Z
* Frequency Body Acceleration Jerk Signal Standard Deviation X Axis <<-- fBodyAccJerk-std()-X
* Frequency Body Acceleration Jerk Signal Standard Deviation Y Axis <<-- fBodyAccJerk-std()-Y
* Frequency Body Acceleration Jerk Signal Standard Deviation Z Axis <<-- fBodyAccJerk-std()-Z
* Frequency Body Acceleration Jerk Signal Mean Frequency X Axis <<-- fBodyAccJerk-meanFreq()-X
* Frequency Body Acceleration Jerk Signal Mean Frequency Y Axis <<-- fBodyAccJerk-meanFreq()-Y
* Frequency Body Acceleration Jerk Signal Mean Frequency Z Axis <<-- fBodyAccJerk-meanFreq()-Z
* Frequency Body Gyroscope Mean X Axis <<-- fBodyGyro-mean()-X
* Frequency Body Gyroscope Mean Y Axis <<-- fBodyGyro-mean()-Y
* Frequency Body Gyroscope Mean Z Axis <<-- fBodyGyro-mean()-Z
* Frequency Body Gyroscope Standard Deviation X Axis <<-- fBodyGyro-std()-X
* Frequency Body Gyroscope Standard Deviation Y Axis <<-- fBodyGyro-std()-Y
* Frequency Body Gyroscope Standard Deviation Z Axis <<-- fBodyGyro-std()-Z
* Frequency Body Gyroscope Mean Frequency X Axis <<-- fBodyGyro-meanFreq()-X
* Frequency Body Gyroscope Mean Frequency Y Axis <<-- fBodyGyro-meanFreq()-Y
* Frequency Body Gyroscope Mean Frequency Z Axis <<-- fBodyGyro-meanFreq()-Z
* Frequency Body Acceleration Magnitude Mean <<-- fBodyAccMag-mean()
* Frequency Body Acceleration Magnitude Standard Deviation <<-- fBodyAccMag-std()
* Frequency Body Acceleration Magnitude Mean Frequency <<-- fBodyAccMag-meanFreq()
* Frequency Body Acceleration Jerk Signal Magnitude Mean <<-- fBodyBodyAccJerkMag-mean()
* Frequency Body Acceleration Jerk Signal Magnitude Standard Deviation <<-- fBodyBodyAccJerkMag-std()
* Frequency Body Acceleration Jerk Signal Magnitude Mean Frequency <<-- fBodyBodyAccJerkMag-meanFreq()
* Frequency Body Gyroscope Magnitude Mean <<-- fBodyBodyGyroMag-mean()
* Frequency Body Gyroscope Magnitude Standard Deviation <<-- fBodyBodyGyroMag-std()
* Frequency Body Gyroscope Magnitude Mean Frequency <<-- fBodyBodyGyroMag-meanFreq()
* Frequency Body Gyroscope Jerk Signal Magnitude Mean <<-- fBodyBodyGyroJerkMag-mean()
* Frequency Body Gyroscope Jerk Signal Magnitude Standard Deviation <<-- fBodyBodyGyroJerkMag-std()
* Frequency Body Gyroscope Jerk Signal Magnitude Mean Frequency <<-- fBodyBodyGyroJerkMag-meanFreq()
* Angle between Time Body Acceleration Mean and Gravity) <<-- angle(tBodyAccMean,gravity)
* Angle between Time Body Acceleration Jerk Signal Mean and Gravity Mean <<-- angle(tBodyAccJerkMean),gravityMean)
* Angle between Time Body Gyroscope Mean and Gravity Mean <<-- angle(tBodyGyroMean,gravityMean)
* Angle between Time Body Gyroscope Jerk Signal Mean and Gravity Mean <<-- angle(tBodyGyroJerkMean,gravityMean)
* Angle between X Axis and Gravity Mean <<-- angle(X,gravityMean)
* Angle between Y Axis and Gravity Mean <<-- angle(Y,gravityMean)
* Angle between Z Axis and Gravity Mean <<-- angle(Z,gravityMean)


###Summary / Aggregation of Data

For each of the 86 mean and standard deviation variables, the R script calculates the average for each combination of subject and activity using the aggregate function.  

The final tidy data set includes one row for each combination of subject and activity.  The average of each variable for the 
corresponding combination of subject and activity is represented in its own column.

The R script uses write.table to export the tidy data set to mean_std_summary.txt.  Once saved to your working directory, this
file may be imported into R using the following code:

import <- read.table("mean_std_summary.txt", header=TRUE)
