## Getting And Cleaning Data Course Project
Repository with script for performing the analysis, a code book that describes the variables, the data, and work that performed to clean up the data (called CodeBook.md) and a README.md file that explains how all of the scripts work and how they are connected.

Contains analysis script, readme.md file and codebook.md file. 
This is a repository for any and all code written for the Getting and Cleaning Data Coursera provided by Johns Hopkins University.
Link to description of the course project https://www.coursera.org/learn/data-cleaning/peer/FIZtT/getting-and-cleaning-data-course-project
***
**Steps of transformation to create tidy data set with summarising information:**

1. Unzip the source (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) into a folder on your local drive.

2. Set working directory (setwd) as "your_path\UCI HAR Dataset" based on directory where you unzip the file from step1.

3. Use read.table() to load data from the files:
  ```train <- read.table("train/X_train.txt")```  
  ```test <- read.table("test/X_test.txt")```  
  ```train_subject <- read.table("train/subject_train.txt", col.names = "subject")```  
  ```test_subject <- read.table("test/subject_test.txt", col.names = "subject")```  
  ```train_activity <- read.table("train/y_train.txt", col.names = "activity_num")```  
  ```test_activity <- read.table("test/y_test.txt", col.names = "activity_num")```  

4. Combines data sets within train & test data for each group of data: rawdata, subject and activity:  
  ```rawdata <- rbind(train, test)```  
  ```subject <- rbind(train_subject, test_subject)```  
  ```activity <- rbind(train_activity, test_activity)```    
  
5. Load data from the "features.txt" file and extract only the measurements on the mean and standard deviation for each measurement within grepl() function to create vector for variables with the mean and standard deviation only.
  ```meanstdvector <- grepl("-mean\\(\\)|-std\\(\\)", features$V2)```  
  ```rawdata <- rawdata[meanstdvector]```  
  
6. Combine rawdata set with activity and subject data sets to get all the data for analysis in one data set:  
  ```tidydata <- cbind(rawdata, subject, activity)```  
  
7. Load data from the "activity_labels.txt" file to get name of activities.  
  ```activity_name <- read.table("activity_labels.txt", col.names = c("activity_num", "activity_name"))```  
 
8. Withing join from plyr package replace the numbers of activities in tidydata set with their names from activity_name data based on "activity_num" variable. Delete "activity_num" after that within select.  
  ```tidydata <- join(tidydata, activity_name, by = "activity_num") %>% select(-activity_num)```  

9. Transform tidydata to tibble format to get more visible results in R console.
  ```tbl_df(tidydata)```  
  
10. Regroup order of columns within select.
  ```tidydata <- tidydata %>% select(subject, activity_name, 1:66)```  
  
11. Make labels of tidydata set more readable with descriptive variable names using gsub() here is code example for "Acc":
  ```names(tidydata) <- gsub("Acc", "Accelerometer", names(tidydata))```  
  
12. Create summary data set using group_by and summarise_each with funs = mean.
  ```summary_tidydata <- tidydata %>% group_by(subject, activity_name) %>% summarise_each(funs(mean))```  

13. Write txt file with write.table (row.names = FALSE) 
  ```write.table(summary_tidydata, file="tidy_data.txt", row.names = FALSE)```  
