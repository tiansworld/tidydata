### Read and merge
## Load necessary libraries
First to load 'plyr','dplyr' and 'tidyr' libraries for later use.
## Create data location variables
To simplify the script, new variables are created to store the UCI HAR Dataset related data files.
## Read training and test data sets
Two data sets are stored in train_df and test_df respectively.
The training and test text file don't have columns names, so the argument 'header=FALSE' is used.
## Read variables names
The variables names are stored in features.txt, it's read by read.table and stored in 'collabels'. 
However, the variables names in features.txt are made of number, space,'()' and other special characters. These characters are deleted for later analysis. See line 17, 18.
## Reading training and test data sets activity labels
The activity labels in train and test directories are correspondent to each row of the data sets.
They are read and stored in variables 'train_label' and 'test_label'. See line 20-22.
## Reading subject id
The subject ids of two data sets are stored in 'train_subject' and 'test_subject'. See line 25-27.
## Add activity labels and subject ids columns to data sets
Data frames train_df and test_df are created, with the columns 'type'(training or test), 'subject_id', 'activity_id" and each variable columns. See line 30 to line 33.
This also appropriately labels the data set with descriptive variable names.
## Merge training and test data sets
Two data frames are merged into a single data frame 'full_data'. Then it is changed to tbl data frame. See line 36-37.
Now the merge of two data sets is completed.

### Extract and calculate
## Extract mean and standard deviation measurements
'tidy_data' stores the selected data set, which only includes the measurements on mean and standard deviation, as well as 'type','subject_id' and 'activity_id'.

### Name the activity id with descriptive names
The name of each activity id is stored in file activity_labels.txt, and it is stored in 'activity_names'. The function 'mapvalues' is used to revalue each activity_id in 'tidy_data' to its corresponding descriptive name.
For example, activity_id 1, is revalued to "1 WALKING". 
## Group data set by subject and activity
'tidy_data' is grouped by subject and activity and is stored in 'grp'. See line 48.
## Calculate the average of each variable for each activity and each subject.
The average of each variable for each activity and each subject is calculated and stored in 'average'. Then it is arranged in increasing order by subject id. And write it to independently data file: tidy_data.txt.
