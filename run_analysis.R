## init ####

require("reshape2")

## getting data ####
if (!file.exists("UCI HAR Dataset")) {
  fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(fileUrl, destfile = "Dataset.zip")
  unzip("Dataset.zip")
  fileConn<-file("date_downloaded.txt")
  writeLines(date(), fileConn)
  close(fileConn)
}

## loading data ####
test.x <- read.table("./UCI HAR Dataset/test/X_test.txt",header=FALSE)
test.y <- read.table("./UCI HAR Dataset/test/y_test.txt",header=FALSE)
test.subjects <- read.table("./UCI HAR Dataset/test/subject_test.txt",header=FALSE)
train.x <- read.table("./UCI HAR Dataset/train/X_train.txt",header=FALSE)
train.y <- read.table("./UCI HAR Dataset/train/y_train.txt",header=FALSE)
train.subjects <- read.table("./UCI HAR Dataset/train/subject_train.txt",header=FALSE)

## 3) Uses descriptive activity names to name the activities in the data set ####
activities <- read.table("./UCI HAR Dataset/activity_labels.txt",header=FALSE,colClasses="character")
test.y$V1 <- factor(test.y$V1,levels=activities$V1,labels=activities$V2)
train.y$V1 <- factor(train.y$V1,levels=activities$V1,labels=activities$V2)

## 4) Appropriately labels the data set with descriptive activity names ####
features <- read.table("./UCI HAR Dataset/features.txt",header=FALSE,colClasses="character")
colnames(test.x)<-features$V2
colnames(train.x)<-features$V2
colnames(test.y)<-c("Activity")
colnames(train.y)<-c("Activity")
colnames(test.subjects)<-c("Subject")
colnames(train.subjects)<-c("Subject")

## 1) merge test and training sets into one data set, including the activities ####
testData<-cbind(test.x,test.y)
testData<-cbind(testData,test.subjects)
testData$Type <- "Test"
trainData<-cbind(train.x,train.y)
trainData<-cbind(trainData,train.subjects)
trainData$Type <- "Train"
df<-rbind(testData,trainData)
#keeping a way to tell test and train data apart
df$Type <- as.factor(df$Type)
df$Subject <- as.factor(df$Subject)

## 2) extract only the measurements on the mean and standard deviation for each measurement ####
interestingcols <- features[grep("(mean|std)\\(", features[,2]),]
mean_and_std <- df[,interestingcols[,2]]

## 5) Create tidy data set ####
ids <- c("Subject", "Activity")
datacol <-setdiff(colnames(df), c(ids,"Type"))
Tidy <- melt(df, id = ids, measure.vars = datacol)
Tidy <- dcast(Tidy, Subject + Activity ~ variable, mean)

## cleanup ####
# not sure I used enough data frames :S
write.table(Tidy, file = "./tidy_data.txt", row.name=FALSE)