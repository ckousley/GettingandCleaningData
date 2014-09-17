#This R script assumes that the contents of the UCI HAR Dataset folder are saved within the working directory.

#Import data

test_dataset <- read.table("./test/X_test.txt")
test_subject <- read.table("./test/subject_test.txt", col.names="Subject")
test_activity <- read.table("./test/Y_test.txt", col.names="Activity")
train_dataset <- read.table("./train/X_train.txt")
train_subject <- read.table("./train/subject_train.txt", col.names="Subject")
train_activity <- read.table("./train/Y_train.txt", col.names="Activity")
variable_labels <- read.table("features.txt", stringsAsFactors=FALSE)
activity_labels <- read.table("activity_labels.txt", col.names=c("Activity", "Activity Name"), stringsAsFactors=FALSE)

#Add variable names to test and training data

colnames(test_dataset) <- variable_labels$V2
colnames(train_dataset) <- variable_labels$V2

#Add columns to indicate subject and activity for each row in test and training data

test_labeled <- cbind(test_subject, test_activity, test_dataset)
train_labeled <- cbind(train_activity, train_subject, train_dataset)

#Step 1 - Merge the test and training data

merged_data <- rbind(test_labeled, train_labeled)

#Step 2 - Extract only the mean and standard deviation for each measurement
#Includes variables with "Mean", "mean", or "std" included anywhere in the variable name

mean_std <- merged_data[ , grep("Subject|Activity|[Mm]ean|std", colnames(merged_data))]

#Step 3 - Replace activity numbers with descriptive activity names
#Install qdap package if needed to allow for easy lookup of activity names

library(qdap)
mean_std$Activity <- lookup(mean_std$Activity, activity_labels)

#Step 4 - Appropriately label the data set with descriptive variable names
#Rather than relabeling each column name by hand, this includes a series of gsub functions
#to search for and substitute technical names and abbreviations with more descriptive text
names(mean_std) <- gsub("^t|\\(t", "Time ", names(mean_std)) 
names(mean_std) <- gsub("^f|\\(f", "Frequency ", names(mean_std)) 
names(mean_std) <- gsub("Mean|-mean|-mean\\()|Mean\\)", " Mean", names(mean_std))
names(mean_std) <- gsub("-std\\()", " Standard Deviation", names(mean_std))
names(mean_std) <- gsub("Freq\\()", " Frequency", names(mean_std))
names(mean_std) <- gsub("-X", " X Axis", names(mean_std))
names(mean_std) <- gsub("-Y", " Y Axis", names(mean_std))
names(mean_std) <- gsub("-Z", " Z Axis", names(mean_std))
names(mean_std) <- gsub("Acc", " Acceleration", names(mean_std)) 
names(mean_std) <- gsub("Gyro", " Gyroscope", names(mean_std))
names(mean_std) <- gsub("Jerk", " Jerk Signal", names(mean_std))
names(mean_std) <- gsub("Mag", " Magnitude", names(mean_std))
names(mean_std) <- gsub("BodyBody", "Body", names(mean_std))
names(mean_std) <- gsub("angle", "Angle between ", names(mean_std)) 
names(mean_std) <- gsub("\\(X", "X Axis", names(mean_std))
names(mean_std) <- gsub("\\(Y", "Y Axis", names(mean_std))
names(mean_std) <- gsub("\\(Z", "Z Axis", names(mean_std))
names(mean_std) <- gsub(",gravity", " and Gravity", names(mean_std)) 

#Step 5 - Create a tidy data set with the average of each variable for each combination of subject and activity
#This creates a tidy data set where:
#-Each variable forms its own column
#-Each combination of subject and activity forms its own row
#It reflects a "wide" format for tidy data, as outlined on the course discussion forum: 
#https://class.coursera.org/getdata-007/forum/thread?thread_id=214#comment-672

mean_std_summary <- aggregate(mean_std[3:ncol(mean_std)], by = mean_std[c("Subject","Activity")], mean)
mean_std_summary <- mean_std_summary[order(mean_std_summary$Subject), ]

#Export tidy data set from Step 5

write.table(mean_std_summary, "mean_std_summary.txt", row.names=FALSE)
# Once saved to your working directory, this txt file may be imported into R using the following code:
# import <- read.table("mean_std_summary.txt", header=TRUE)
