

CodeBook

The code book that describes the variables, the data, and any transformations or work that 
performed to clean up the data.
----

Source zip file has collection of data to perfom data cleaning and analysis
Source zip file url: "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

----
Collection of the raw data include several files in the "UCI HAR Dataset" folder.

"UCI HAR Dataset" folder:
features.txt: Names of the 561 features.
activity_labels.txt: Names and id for each of the 6 activities.

"UCI HAR Dataset/train" folder:
X_train.txt: 7352 observations of the 561 features (21 of the 30 volunteers).
y_train.txt: A vector of 7352 integers, the id of the activity.
subject_train.txt: A vector of 7352 integers, id of the subject-volunteers

"UCI HAR Dataset/test" folder:
X_test.txt: 2947 observations of the 561 features (9 of the 30 volunteers).
y_test.txt: A vector of 2947 integers, the id of the activity.
subject_test.txt: A vector of 2947 integers, id of the subject-volunteers

----

Variables:

After tranforming and cleaning data (see README file) the final tidy data set "tidy_data.txt" has 68 variables:

"1" "subject": describes a unique identifier for each of 30 subjects by the number (1,2,...30)
"2" "activity_name": descriptive labels of the activity.
"3" "time_BodyAccelerometer_mean()_X"
"4" "time_BodyAccelerometer_mean()_Y"
"5" "time_BodyAccelerometer_mean()_Z"
"6" "time_BodyAccelerometer_std()_X"
"7" "time_BodyAccelerometer_std()_Y"
"8" "time_BodyAccelerometer_std()_Z"
"9" "time_GravityAccelerometer_mean()_X"
"10" "time_GravityAccelerometer_mean()_Y"
"11" "time_GravityAccelerometer_mean()_Z"
"12" "time_GravityAccelerometer_std()_X"
"13" "time_GravityAccelerometer_std()_Y"
"14" "time_GravityAccelerometer_std()_Z"
"15" "time_BodyAccelerometerJerk_mean()_X"
"16" "time_BodyAccelerometerJerk_mean()_Y"
"17" "time_BodyAccelerometerJerk_mean()_Z"
"18" "time_BodyAccelerometerJerk_std()_X"
"19" "time_BodyAccelerometerJerk_std()_Y"
"20" "time_BodyAccelerometerJerk_std()_Z"
"21" "time_BodyGyroscope_mean()_X"
"22" "time_BodyGyroscope_mean()_Y"
"23" "time_BodyGyroscope_mean()_Z"
"24" "time_BodyGyroscope_std()_X"
"25" "time_BodyGyroscope_std()_Y"
"26" "time_BodyGyroscope_std()_Z"
"27" "time_BodyGyroscopeJerk_mean()_X"
"28" "time_BodyGyroscopeJerk_mean()_Y"
"29" "time_BodyGyroscopeJerk_mean()_Z"
"30" "time_BodyGyroscopeJerk_std()_X"
"31" "time_BodyGyroscopeJerk_std()_Y"
"32" "time_BodyGyroscopeJerk_std()_Z"
"33" "time_BodyAccelerometerMagnitude_mean()"
"34" "time_BodyAccelerometerMagnitude_std()"
"35" "time_GravityAccelerometerMagnitude_mean()"
"36" "time_GravityAccelerometerMagnitude_std()"
"37" "time_BodyAccelerometerJerkMagnitude_mean()"
"38" "time_BodyAccelerometerJerkMagnitude_std()"
"39" "time_BodyGyroscopeMagnitude_mean()"
"40" "time_BodyGyroscopeMagnitude_std()"
"41" "time_BodyGyroscopeJerkMagnitude_mean()"
"42" "time_BodyGyroscopeJerkMagnitude_std()"
"43" "frequency_BodyAccelerometer_mean()_X"
"44" "frequency_BodyAccelerometer_mean()_Y"
"45" "frequency_BodyAccelerometer_mean()_Z"
"46" "frequency_BodyAccelerometer_std()_X"
"47" "frequency_BodyAccelerometer_std()_Y"
"48" "frequency_BodyAccelerometer_std()_Z"
"49" "frequency_BodyAccelerometerJerk_mean()_X"
"50" "frequency_BodyAccelerometerJerk_mean()_Y"
"51" "frequency_BodyAccelerometerJerk_mean()_Z"
"52" "frequency_BodyAccelerometerJerk_std()_X"
"53" "frequency_BodyAccelerometerJerk_std()_Y"
"54" "frequency_BodyAccelerometerJerk_std()_Z"
"55" "frequency_BodyGyroscope_mean()_X"
"56" "frequency_BodyGyroscope_mean()_Y"
"57" "frequency_BodyGyroscope_mean()_Z"
"58" "frequency_BodyGyroscope_std()_X"
"59" "frequency_BodyGyroscope_std()_Y"
"60" "frequency_BodyGyroscope_std()_Z"
"61" "frequency_BodyAccelerometerMagnitude_mean()"
"62" "frequency_BodyAccelerometerMagnitude_std()"
"63" "frequency_BodyAccelerometerJerkMagnitude_mean()"
"64" "frequency_BodyAccelerometerJerkMagnitude_std()"
"65" "frequency_BodyGyroscopeMagnitude_mean()"
"66" "frequency_BodyGyroscopeMagnitude_std()"
"67" "frequency_BodyGyroscopeJerkMagnitude_mean()"
"68" "frequency_BodyGyroscopeJerkMagnitude_std()"
