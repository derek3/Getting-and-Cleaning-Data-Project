# Getting-and-Cleaning-Data-Project
The following files are included in this project:
- run_analysis.R -contains R code to run
- README.me - this project description file
- Codebook - variables used in run_analysis.R


This project for the Getting and Cleaning Data course takes smartphone data as output by its motion sensors according to the study
of 30 subjects peforming various activities as detailed here: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

With data files available here:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The following procedures were followed to extract and summarize the means and standard deviations of 81 categories of
measurements compiled by the researchers of the study at the UC Irvine Machine Learning Repository in 2012.

Basic steps taken to prepare the data for use in the run_analyis.R file:
- Download Zip file and save to R’s default data directory
- Merge the training and test together to create a single dataset for processing and analysis
- Extract only the measurements on the mean and standard deviation for each measurement
** Assumption**  - it was assumed that measurements containing the word ‘mean’ were means (i.e. not just 
those whose descriptions ended with the word mean, such as 'fBodyAcc-meanFreq()'
- Alter the column names to use better descriptions and conform to R naming standards
4.Appropriately labels the data set with descriptive variable names. 
5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


