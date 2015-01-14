## Import necessary libraries -- dplyr, tidlyr
library(dplyr,tidyr)

## Read training data set
# get current work directory, so I can know where to find the dataset
dir_loc <- paste0(getwd(),"/","UCI\ HAR\ Dataset/",sep="")
train_dir_loc <- paste0(getwd(),"/","UCI\ HAR\ Dataset/train/X_train.txt",sep="")
test_dir_loc <- paste0(getwd(),"/","UCI\ HAR\ Dataset/test/X_test.txt",sep="")
## read training main data set
train_df <- read.table(train_dir_loc,header=FALSE,colClasses="numeric")
## read test main data set
test_df <- read.table(test_dir_loc,header=FALSE,colClasses="numeric")

#Read the descriptive variable names
col_labels <- readLines(paste0(dir_loc,"/features.txt",sep=""))

## read training active labels
train_label <- readLines(paste0(dir_loc,"/train/y_train.txt",sep="")) 
## read test active labels
test_label <- readLines(paste0(dir_loc,"/test/y_test.txt",sep="")) 

## read training subject ids
train_subject <- readLines(paste0(dir_loc,"/train/subject_train.txt",sep="")) 
## read test subject ids
test_subject <- readLines(paste0(dir_loc,"/test/subject_test.txt",sep="")) 

#Add label columns to the data sets
train_df <- cbind(type=rep("train",length(train_subject)),train_subject,train_label,train_df)
colnames(train_df) <- c("type","subject_id","active_id",col_labels)
test_df <- cbind(type=rep("test",length(test_subject)),test_subject,test_label,test_df)
colnames(test_df) <- c("type","subject_id","active_id",col_labels)

## Merge two together and add the descriptive variable names to each column
full_data <- merge(test_df,train_df,all.x=T,all.y=T)
full_data <- tbl_df(full_data)

## Select only the mearsurements on the mean and standard deviation. That is the conlumns variable names contain "mean" and "std"
tidy_data <- select(full_data,type,subject_id,active_id,contains("mean()"),contains("std()"))