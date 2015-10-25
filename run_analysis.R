#script for the assignment of coursera Getting and Cleaning Data course
#run with:source("run_analysis.R")


#load dplyr library
library(dplyr)
#read data
trainData<-read.table("train/X_train.txt", header = FALSE)
testData<-read.table("test/X_test.txt", header = FALSE)
testSubj<-read.table("test/subject_test.txt", header = FALSE)
trainSubj<-read.table("train/subject_train.txt", header = FALSE)
trainLbls<-read.table("train/y_train.txt", header = FALSE)
testLbls<-read.table("test/y_test.txt", header = FALSE)

#read features names
features<-read.table("features.txt", header = FALSE)
#read the file with the activity labels
actvLbls<-read.table("activity_labels.txt", header = FALSE)

#apply feature names to columns
names(testData)<-as.character(features$V2)
names(trainData)<-as.character(features$V2)

#add subjects column
testData$Subject<-testSubj$V1
trainData$Subject<-trainSubj$V1

#create Activity columns as a factor vector based on the activity labels
testData$Activity<-factor(testLbls$V1,labels=actvLbls$V2)
trainData$Activity<-factor(trainLbls$V1,labels=actvLbls$V2)

#merge the two datasets
totalDF<-rbind(trainData,testData)

#find the column index with "mean" and "std" as defined in features_info.txt
#"...The set of variables that were estimated from these signals are: 
#mean(): Mean value
#std(): Standard deviation ... "
colIndx<-grep("mean\\(",features$V2,ignore.case = TRUE)
colIndx<-append(colIndx,grep("std\\(",features$V2,ignore.case = TRUE))
colIndx<-append(colIndx,which(colnames(totalDF)=="Activity"|colnames(totalDF)=="Subject"))
colIndx<-sort(colIndx)
#filter the data frame with colIndx
filteredTotalDF<-totalDF[,colIndx]

# create tidy data set with the average of each variable for each activity and each subject.
SubjectDFSum<-group_by(filteredTotalDF,Activity, Subject) %>% summarise_each(funs(mean))
#write the file the result
write.table(SubjectDFSum,file = "result.txt",row.names = FALSE)

