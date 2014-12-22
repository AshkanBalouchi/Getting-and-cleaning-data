# At first step, we read the training and test results into separate
# data tables:
trnDt <- read.table("./UCI HAR Dataset/train/X_train.txt")
trnLbl <- read.table("./UCI HAR Dataset/train/y_train.txt")
trnSub <- read.table("./UCI HAR Dataset/train/subject_train.txt")
testDt <- read.table("./UCI HAR Dataset/test/X_test.txt")
testLbl <- read.table("./UCI HAR Dataset/test/y_test.txt")
testSub <- read.table("./UCI HAR Dataset/test/subject_test.txt")

# Now we merge training and test sets tocreat one data set:
joinedDt <- rbind(trnDt, testDt)
joinedLbl <- rbind(trnLbl, testLbl)
joinedSub <- rbind(trnSub, testSub)

# Now we like to extract only the mean and std deviation for each measurement
# and relabel each column name with respect to their new values.
features <- read.table("./UCI HAR Dataset/features.txt")
meanstd <- grep("mean\\(\\)|std\\(\\)", features[, 2])
joinedDt <- joinedDt[, meanstd]
names(joinedDt) <- gsub("\\(\\)", "", features[meanstd, 2]) # remove "()"


# Then we would like to use descriptive activity names to name the activities
# in the data set:
activityname <- read.table("./UCI HAR Dataset/activity_labels.txt")
activityLbl <- activityname[joinedLbl[, 1], 2]
joinedLbl[, 1] <- activityLbl
names(joinedLbl) <- "Activity"


# Now that we have labled the activities in the label data set, now we 
# want to import the appropriate labels to the data set with discriptive 
# variable names:

names(joinedSub) <- "subject"
step4Dt <- cbind(joinedSub, joinedLbl, joinedDt)


# From the data set "step4Dt" we already created, now we would like 
# to creat a new tidy data set with the average of each variable for 
# each activity and each subject.

step4Dt$Activity <- as.factor(step4Dt$Activity)
step4Dt$subject <- as.factor(step4Dt$subject)
final = aggregate(step4Dt, by=list(Activity = step4Dt$Activity, subject=step4Dt$subject), mean)
final[,3] = NULL
final[,3] = NULL

write.table(final, "MeanValues.txt", sep="\t")
