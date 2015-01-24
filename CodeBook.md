## CodeBook
This file simply decribes variables which are used in run_analysis.R script for cleaning data.
* <pre>dir_loc</pre> The location of UCI HAR Dataset
* <pre>train_dir_loc</pre>
* <pre>test_dir_loc</pre> The locations of train and test data files in UCI HAR Dataset.
* <pre>train_df</pre>
* <pre>test_df</pre> Data frames, used to store training and test data sets.
* <pre>collabels</pre> Data frames, stores each measurement names.
* <pre>col_labels</pre> Vector, each measurement names with special character removed, and names are changed from upper case to lower case.
* <pre>train_label</pre><pre>test_label</pre> Vector, stores training and test activity labels.
* <pre>train_subject</pre><pre>test_subject</pre> Vector, stores subject id
* <pre>train_df</pre><pre>test_df</pre> Data frame, stores train and test data set, including:

**<pre>type</pre> Stores the type of data set --  train or test.

**<pre>subject_id</pre> Column of subject id

**<pre>activity_id<pre> Column of activity labels

* <pre>full_data</pre> tbl data frame, includes both train and test data.
* <pre>tidy_data</pre> tbl data frame, includes only the mean and standard deviation columns.
* <pre>activity_names</pre> Vector, stores activity names.
* <pre>grp</pre> tidy_data grouped by subject id and activity id.
* <pre>average</pre> Average of each variable for each subject id and each activity. Ordered by subject id.

## UCI HAR Data set infomation
<pre>
UCI\ HAR\ Dataset
|-- activity_labels.txt
|-- features_info.txt
|-- features.txt
|-- README.txt
|-- test
|   |-- Inertial\ Signals
|   |   |-- body_acc_x_test.txt
|   |   |-- body_acc_y_test.txt
|   |   |-- body_acc_z_test.txt
|   |   |-- body_gyro_x_test.txt
|   |   |-- body_gyro_y_test.txt
|   |   |-- body_gyro_z_test.txt
|   |   |-- total_acc_x_test.txt
|   |   |-- total_acc_y_test.txt
|   |   `-- total_acc_z_test.txt
|   |-- subject_test.txt
|   |-- X_test.txt
|   `-- y_test.txt
`-- train
    |-- Inertial\ Signals
    |   |-- body_acc_x_train.txt
    |   |-- body_acc_y_train.txt
    |   |-- body_acc_z_train.txt
    |   |-- body_gyro_x_train.txt
    |   |-- body_gyro_y_train.txt
    |   |-- body_gyro_z_train.txt
    |   |-- total_acc_x_train.txt
    |   |-- total_acc_y_train.txt
    |   `-- total_acc_z_train.txt
    |-- subject_train.txt
    |-- X_train.txt
    `-- y_train.txt
</pre>

Below is the detail of the data cleaning preocess.

## Read and merge

### Load necessary libraries
First to load 'plyr','dplyr' and 'tidyr' libraries for later use.
### Create data location variables
To simplify the script, new variables are created to store the UCI HAR Dataset related data files.
### Read training and test data sets
Two data sets are stored in train_df and test_df respectively.
The training and test text file don't have columns names, so the argument 'header=FALSE' is used.
### Read variables names
The variables names are stored in features.txt, it's read by read.table and stored in 'collabels'. 
However, the variables names in features.txt are made of number, space,'()' and other special characters. These characters are deleted for later analysis. See line 17, 18.
### Reading training and test data sets activity labels
The activity labels in train and test directories are correspondent to each row of the data sets.
They are read and stored in variables 'train_label' and 'test_label'. See line 20-22.
### Reading subject id
The subject ids of two data sets are stored in 'train_subject' and 'test_subject'. See line 25-27.
### Add activity labels and subject ids columns to data sets
Data frames train_df and test_df are created, with the columns 'type'(training or test), 'subject_id', 'activity_id" and each variable columns. See line 30 to line 33.
This also appropriately labels the data set with descriptive variable names.
### Merge training and test data sets
Two data frames are merged into a single data frame 'full_data'. Then it is changed to tbl data frame. See line 36-37.
Now the merge of two data sets is completed.

## Extract and calculate
### Extract mean and standard deviation measurements
'tidy_data' stores the selected data set, which only includes the measurements on mean and standard deviation, as well as 'type','subject_id' and 'activity_id'.

## Name the activity id with descriptive names
The name of each activity id is stored in file activity_labels.txt, and it is stored in 'activity_names'. The function 'mapvalues' is used to revalue each activity_id in 'tidy_data' to its corresponding descriptive name.
For example, activity_id 1, is revalued to "1 WALKING". 
### Group data set by subject and activity
'tidy_data' is grouped by subject and activity and is stored in 'grp'. See line 48.
### Calculate the average of each variable for each activity and each subject.
The average of each variable for each activity and each subject is calculated and stored in 'average'. Then it is arranged in increasing order by subject id. And write it to independently data file: tidy_data.txt.
