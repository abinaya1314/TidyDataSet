## The files "X_test.txt" and "X_train.txt" contain the measurement data
## for different variables listed in "features.txt" file.

## "y_test.txt" and "y_train.txt" contains the code numbers from 1 to 6 
## which are described in "activity_labels.txt"

setwd("D:/r workspace/data_extraction/UCI HAR Dataset/test")
test<-read.table("X_test.txt")
label_code_test<-read.table("y_test.txt")
test_subject<-read.table("subject_test.txt")

setwd("D:/r workspace/data_extraction/UCI HAR Dataset/train")
train<-read.table("X_train.txt")
label_code_train<-read.table("y_train.txt")
train_subject<-read.table("subject_train.txt")

## All the columns in test dataset and training dataset are named 
## as described in label_string (that is, from "features.txt")

setwd("D:/r workspace/data_extraction/UCI HAR Dataset")
features_labels<-read.table("features.txt",colClasses = "character")
flabels<-features_labels$V2

names(test)<-flabels
names(train)<-flabels

subject<-c(test_subject$V1,train_subject$V1)

## activity_test<-label_code_test$V1
## activity_train<-label_code_train$V1

## to link the activity names to all the rows in the test and training datasets,
## convert the codes in 'label_code_test' and 'label_code_train' to their respective
## names given in the "activity_labels.txt"

## 3. Descriptive activity names are used to name the activities 
## in the merged dataset

apply_activity<-function(ac)
{
  for(i in 1:length(ac))
  {
    if(ac[i]==1)
      ac[i]<-"WALKING"
    if(ac[i]==2)
      ac[i]<-"WALKING_UPSTAIRS"
    if(ac[i]==3)
      ac[i]<-"WALKING_DOWNSTAIRS"
    if(ac[i]==4)
      ac[i]<-"SITTING"
    if(ac[i]==5)
      ac[i]<-"STANDING"
    if(ac[i]==6)
      ac[i]<-"LAYING"
  }
  invisible(ac)
}

activity_test<-apply_activity(label_code_test$V1)
activity_train<-apply_activity(label_code_train$V1)
activity<-c(activity_test,activity_train)


## 1.The training and test datasets are merged together a new dataset "binded"is created

library(dplyr)
binded<-rbind(test,train)
valid_column_names <- make.names(names=names(binded), unique=TRUE, allow_ = TRUE)
names(binded) <- valid_column_names

## 2. Extracting only the measurements on the mean and standard deviation 
## for each measurement

std_measures<-binded %>% select(contains(".std"))
mean_measures<- binded %>% select(contains(".mean"))
MeanAndStd<-cbind(mean_measures,std_measures)

## 5. Average is calculated for each variable in the dataset 

MeansOfAllColumns<-colMeans(MeanAndStd)


## 4. The data set is appropriately labelled with descriptive variable names.

MeanAndStd<-cbind(activity,subject,MeanAndStd)

## 5. Average is calculated for each subject in the dataset 

sub_splited<-split(MeanAndStd,MeanAndStd$subject)
mean_subjectwise<-sapply(sub_splited,function(x){ y=data.matrix(x);colMeans(y) })
SubjectAverage<-mean_subjectwise[3:nrow(mean_subjectwise),]


## 5. Average is calculated for each activity

activity_split<-split(MeanAndStd,MeanAndStd$activity)
mean_activity<-sapply(activity_split,function(x){ y=data.matrix(x); colMeans(y)})
ActivityAverage<-mean_activity[3:nrow(mean_activity),]


## Remove the symbol '##' infront of the object names to view that particular data

## The newly created tidy dataset is stored in object,
## MeanAndStd

## Only the measurements on the mean and standard deviation 
## for each measurement is stored in object,
## MeanAndStd 

## Average of each activity is stored in object, 
## ActivityAverage

## Average of each subject is stored in object,
## SubjectAverage

## The last row of the final tidy data set contains the average of
## each feature. It is stored in object,
## MeansOfAllColumns



