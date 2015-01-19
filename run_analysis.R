## Import necessary libraries -- dplyr, tidlyr
library(plyr,dplyr,tidyr)

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
#col_labels <- readLines(paste0(dir_loc,"/features.txt",sep=""))
collabels <- read.table(paste0(dir_loc,"/features.txt",sep=""),stringsAsFactors=F,sep=" ",header=F)
col_labels <- paste0(collabels[,1],"_",collabels[,2],sep="")
col_labels <- tolower(sapply(col_labels,function(x) gsub(" +|_|-|\\.|\\(|\\)",x, replacement="")))
## read training active labels
train_label <- readLines(paste0(dir_loc,"/train/y_train.txt",sep="")) 
## read test active labels
test_label <- readLines(paste0(dir_loc,"/test/y_test.txt",sep="")) 

## read training subject ids
train_subject <- readLines(paste0(dir_loc,"/train/subject_train.txt",sep="")) 
## read test subject ids
test_subject <- readLines(paste0(dir_loc,"/test/subject_test.txt",sep="")) 

#Add label columns to the data sets
train_df <- cbind(type=rep("train",length(train_subject)),as.numeric(train_subject),train_label,train_df)
colnames(train_df) <- c("type","subject_id","active_id",col_labels)
test_df <- cbind(type=rep("test",length(test_subject)),as.numeric(test_subject),test_label,test_df)
colnames(test_df) <- c("type","subject_id","active_id",col_labels)

## Merge two together and add the descriptive variable names to each column
full_data <- rbind(test_df,train_df)
full_data <- tbl_df(full_data)

## Select only the mearsurements on the mean and standard deviation. That is the conlumns variable names contain "mean" and "std"
tidy_data <- select(full_data,type,subject_id,active_id,contains("mean"),contains("std"))

## Name the actives with a meaningful name for active_id column, the meaningful name is from original data file activity_labels.txt
activity_names <- readLines(paste0(dir_loc,"activity_labels.txt",sep=""))
tidy_data$active_id <- mapvalues(tidy_data$active_id, c(1:6), activity_names)
## Group by subject label and active label
grp <- group_by(tidy_data,subject_id,active_id)

## Summarise each variable(exclude activity, subject and type) for each activity and each subject
average <- summarise_each(grp,funs(mean),4:89)

## Arrange data by subject id
average <- arrange(average,subject_id)
## Write the summarise data to file
write.table(average,file=paste0(getwd(),"/getdata/project/tidy_data.txt",sep=""),row.names=F)
