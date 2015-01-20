## CodeBook
This file simply decribes variables which are used in run_analysis.R script for cleaning data.
* <pre>dir_loc</pre> The location of UCI HAR Dataset
* <pre>train_dir_loc</pre>
* <pre>test_dir_loc</pre> The locations of train and test data files in UCI HAR Dataset.
* <pre>train_df</pre>
* <pre>test_df</pre> Data frames, used to store training and test data sets.
* <pre>collabels</pre> Data frames, stores each measurement names.
* <pre>col_labels</pre> Vector, each measurement names with special character removed, and names are changed from upper case to lower case.
* <pre>train_label</pre>,<pre>test_label</pre> Vector, stores training and test activity labels.
* <pre>train_subject</pre>,<pre>test_subject</pre> Vector, stores subject id
* <pre>train_df</pre>,<pre>test_df</pre> Data frame, stores train and test data set, including:
** <pre>type</pre> Stores the type of data set --  train or test.
** <pre>subject_id</pre> Column of subject id
** <pre>activity_id<pre> Column of activity labels
* <pre>full_data</pre> tbl data frame, includes both train and test data.
* <pre>tidy_data</pre> tbl data frame, includes only the mean and standard deviation columns.
* <pre>activity_names</pre> Vector, stores activity names.
* <pre>grp</pre> tidy_data grouped by subject id and activity id.
* <pre>average</pre> Average of each variable for each subject id and each activity. Ordered by subject id.
## UCI HAR Data set infomation

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

For the detail of data cleaning process, please read README.md
