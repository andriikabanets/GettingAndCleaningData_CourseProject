
You should create one R script called run_analysis.R that does the following.

# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names.
# 5. From the data set in step 4, creates a second, independent tidy data set with 
#     the average of each variable for each activity and each subject.
-----

# load packages:
library(tidyverse)
library(plyr)

# 1. Merges the training and the test sets to create one data set:
train <- read.table("train/X_train.txt")
test <- read.table("test/X_test.txt")

train_subject <- read.table("train/subject_train.txt", col.names = "subject")
test_subject <- read.table("test/subject_test.txt", col.names = "subject")

train_activity <- read.table("train/y_train.txt", col.names = "activity_num")
test_activity <- read.table("test/y_test.txt", col.names = "activity_num")

# 1.1. Combines data sets within train & test data for each group of data: rawdata, subject and activity:
rawdata <- rbind(train, test)
subject <- rbind(train_subject, test_subject)
activity <- rbind(train_activity, test_activity)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
features <- read.table("features.txt")
meanstdvector <- grepl("-mean\\(\\)|-std\\(\\)", features$V2)
names(rawdata) <- features$V2
rawdata <- rawdata[meanstdvector]
names(rawdata) # optional: check the result

# combine rawdata set with activity and subject data sets
tidydata <- cbind(rawdata, subject, activity)

# 3. Uses descriptive activity names to name the activities in the data set
activity_name <- read.table("activity_labels.txt", col.names = c("activity_num", "activity_name"))
tidydata <- join(tidydata, activity_name, by = "activity_num") %>% select(-activity_num)
tidydata$activity_name <- tolower(tidydata$activity_name)
table(tidydata$activity_name) # optional: check the result
tbl_df(tidydata) # optional: for better 

# regroup order of columns:
tidydata <- tidydata %>% select(subject, activity_name, 1:66) %>% tbl_df()
tidydata

# optional: clean Global Environment
# rm(list = ls()[!ls() %in% "tidydata"]) 

# 4. Appropriately labels the data set with descriptive variable names.
names(tidydata) <- gsub("^t", "time_", names(tidydata))
names(tidydata) <- gsub("^f", "frequency_", names(tidydata))
names(tidydata) <- gsub("-", "_", names(tidydata))
names(tidydata) <- gsub("Acc", "Accelerometer", names(tidydata))
names(tidydata) <- gsub("Gyro", "Gyroscope", names(tidydata))
names(tidydata) <- gsub("Mag", "Magnitude", names(tidydata))
names(tidydata) <- gsub("Freq", "Frequency", names(tidydata))
names(tidydata) <- gsub("BodyBody", "Body", names(tidydata))


# 5. From the data set in step 4, creates a second, independent tidy data set with 
#     the average of each variable for each activity and each subject.

summary_tidydata <- tidydata %>% group_by(subject, activity_name) %>% summarise_each(funs(mean))
write.table(summary_tidydata, file="tidy_data.txt", row.names = FALSE)

