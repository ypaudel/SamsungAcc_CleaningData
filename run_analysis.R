## This R code reads the raw samsung datasets from your R working directory; combines,
## cleans and summarizes the means of various other variables, for test Subject and 
## their Activity type variables.


### 1.
     ## READING Various raw txt files into R.
     ActLabels <- read.table("./UCI HAR Dataset/activity_labels.txt", 
                             stringsAsFactors=FALSE)
     features <- read.table("./UCI HAR Dataset/features.txt", 
                            stringsAsFactors=FALSE)
     testsub <- read.table("./UCI HAR Dataset/test/subject_test.txt", 
                           stringsAsFactors=FALSE)
     testx <- read.table("./UCI HAR Dataset/test/X_test.txt", stringsAsFactors=FALSE)
     testy <- read.table("./UCI HAR Dataset/test/y_test.txt", stringsAsFactors=FALSE)

     trainsub <- read.table("./UCI HAR Dataset/train/subject_train.txt",
                            stringsAsFactors=FALSE)
     trainx <- read.table("./UCI HAR Dataset/train/X_train.txt", stringsAsFactors=FALSE)
     trainy <- read.table("./UCI HAR Dataset/train/y_train.txt", stringsAsFactors=FALSE)


     ## BINDING related tables together.
     testx2 <- cbind(testsub,testy,testx)         #Binding table for test subjects
     trainx2 <- cbind(trainsub,trainy,trainx)     #Binding table for training subjects

     ## MERGING test and training datasets into one. (STEP-1 in Proj)
     mergedata <- rbind(testx2,trainx2)
     colnames(mergedata) <- c("Subject", "Activity", features$V2) #Applying proper column names

### 2. 
     ## EXTRACTING Only the measurements on mean() and std()
     v.names <- c('mean()','std()')
     patt <- sub(',\\s','|',(toString(v.names)))
     id.group <- grepl(patt,colnames(mergedata))
     temp <- mergedata[,id.group]
     mergedata <- cbind(mergedata[,1:2],temp)

### 3.
     ## Create a new Column for Descriptive Activity Names using corresponding number values.
     mergedata$ActivityName <- ifelse(mergedata$Activity %in% c(ActLabels$V1), 
                                 ActLabels$V2, NA)

### 4.
     ## Descreptive Variable Names: Cleaning up the column names for clearity.

     #First, removing hypnens and parantheses.
     colnames(mergedata) <- c(gsub("-|\\()", "", names(mergedata)))
     #Next, replacing abbreviations to more clearer descriptions.
     colnames(mergedata) <- c(gsub("tBodyAcc","TimeBodyAccleration",names(mergedata)))
     colnames(mergedata) <- c(gsub("tGravityAcc","TimeGravityAccleration",names(mergedata)))
     colnames(mergedata) <- c(gsub("tBodyGyro","TimeBodyGyro",names(mergedata)))
     colnames(mergedata) <- c(gsub("tBodyAcc","TimeBodyAccleration",names(mergedata)))
     colnames(mergedata) <- c(gsub("fBodyAcc","FTPBodyAccleration",names(mergedata)))
     colnames(mergedata) <- c(gsub("fGravityAcc","FTPGravityAccleration",names(mergedata)))
     colnames(mergedata) <- c(gsub("fBodyGyro","FTPBodyGyro",names(mergedata)))
     colnames(mergedata) <- c(gsub("fBodyAcc","FTPBodyAccleration",names(mergedata)))
     colnames(mergedata) <- c(sub("mean","Mean",names(mergedata)))
     colnames(mergedata) <- c(sub("std","StDev",names(mergedata)))
     colnames(mergedata) <- c(gsub("fBodyBody","FreqBody",names(mergedata)))

     
### 5.
     # Before doing final analysis, removing Activity column (with numbers), 
     # because we already have ActivityNames with descreptive variables
     mergedata$Activity= NULL
     
     # Aggregating the data with mean values of all variables for each subject, and
     # each Activity type.
     finaldata <- aggregate( . ~ Subject +  ActivityName,data= mergedata, mean)
     
     # Writing the final results to an text file (default location is working directory)
     write.table(finaldata,"TidyData.txt",row.names=FALSE)
     
## NOTE: TO READ BACK THE OUTPUT FILE IN R
## "head(read.table(filelocation, header=TRUE,stringsAsFactors=FALSE))"
