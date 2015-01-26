run_analysis <- function() {

   ## 1.
   ## Load test and train files into R 
   ## Note: files were copied into the default data directory from their original subfolders
   activity_labels <- read.table("activity_labels.txt")
   features <- read.table("features.txt")
   subject_train <- read.table("subject_train.txt")
   X_train <- read.table("X_train.txt")
   y_train <- read.table("y_train.txt")
   subject_test <- read.table("subject_test.txt")
   X_test <- read.table("X_test.txt")
   y_test <- read.table("y_test.txt")
   
   
   
   ## Combine testing and training data by appending training data rows to test data rows
   measures_combined <- rbind(X_test,X_train)
   activities_combined <- rbind(y_test,y_train)
   subjects_combined <- rbind(subject_test,subject_train)
   
   ## 4.
   ## Store and modify column names to correct some errors, clarify some variables, and make them
   ## legal column names (i.e. remove some non-alpha characters)
   features_renamed<-features
   features_renamed<-make.names(features_renamed[,2],unique=TRUE)
   features_renamed<-features
   features_renamed<-make.names(features_renamed[,2],unique=TRUE)
   features_renamed<-gsub("..","",features_renamed,fixed=TRUE)
   features_renamed<-sub("mean","Mean",features_renamed)
   features_renamed<-sub("std","StdDev",features_renamed)
   features_renamed<-sub("BodyBody","Body",features_renamed)
   
   ## Rename columns with the edited names
   colnames(measures_combined)<-features_renamed
   
   
   ## 2.
   ## load data.table package
   ## Find columns which contain either mean or standard deviation results and store these in data 
   ## frames std_combined and mean_combined
   std_cols <- which(features$V2 %like% "std")
   mean_cols <- which(features$V2 %like% "mean")
   std_combined <- measures_combined[,std_cols]
   mean_combined <- measures_combined[,mean_cols]
   
   ## load dplyr package
   ## Create a data set which contains the subjects, activites, and only the mean and standard
   ## deviation results and rename first two columns (subjectnb and activity)
   subjects_combined <- rename(subjects_combined,subjectnb=V1)
   activities_combined <- rename(activities_combined,actvity=V1)
   mean_stddev_dataset <- cbind(subjects_combined, activities_combined, mean_combined, std_combined)
   
   
   
   ## 3.  (http://www.statmethods.net/input/valuelabels.html)
   ## Replace activity numbers with activity descriptions in the mean_stddev_dataset data frame
   mean_stddev_dataset[,2]<-factor(mean_stddev_dataset[,2],levels=activity_labels$V1,labels=activity_labels$V2)
   
   ##combined
   
   ## 5. Create a tidy data set
   summary_dataset <- summarise_each(group_by(mean_stddev_dataset,subjectnb,actvity),funs(mean))
   
   ## return (list(mean_stddev_dataset,summary_dataset))
   summary_dataset
   

}
