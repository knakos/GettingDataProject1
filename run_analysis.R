# CONSIDER TRAINING DATASET
setwd("./train")

subject_train <- read.table("subject_train.txt", sep="", stringsAsFactors = FALSE)
train_data <- read.table("X_train.txt", sep="", stringsAsFactors = FALSE)
train_activities <- read.table("Y_train.txt", sep="", stringsAsFactors = FALSE)

colnames(subject_train)[1] <- "Subject"
colnames(train_activities)[1] <- "Activity"

setwd("..")

mylabels <- read.table("features.txt", sep="", stringsAsFactors = FALSE)
colnames(mylabels)[1] <- "featureCode"
colnames(mylabels)[2] <- "featureName"

for(i in 1:nrow(mylabels)){
 colnames(train_data)[i] <- mylabels$featureName[i]
}

total_train <- cbind(subject_train, train_activities, train_data)
total_train["origin"] <- "train"

# CONSIDER TEST DATASET
setwd("./test")

subject_test <- read.table("subject_test.txt", sep="", stringsAsFactors = FALSE)
test_data <- read.table("X_test.txt", sep="", stringsAsFactors = FALSE)
test_activities <- read.table("Y_test.txt", sep="", stringsAsFactors = FALSE)

colnames(subject_test)[1] <- "Subject"
colnames(test_activities)[1] <- "Activity"

for(i in 1:nrow(mylabels)){
  colnames(test_data)[i] <- mylabels$featureName[i]
}

total_test <- cbind(subject_test, test_activities, test_data)
total_test["origin"] <- "test"

setwd("..")

# MERGE THE TWO DATASETS
total_data <- rbind(total_test, total_train)

# NAME THE ACTIVITIES AS APPROPRIATE AND ENSURE CONVERSION TO FACTORS
activity.code <- c(WALKING = 1, WALKING_UPSTAIRS = 2, WALKING_DOWNSTAIRS = 3, SITTING = 4, STANDING = 5, LAYING = 6)
total_data$Activity <- names(activity.code)[match(total_data$Activity, activity.code)]
total_data$Activity <- as.factor(total_data$Activity)

# EXTRACT MEAN AND STANDARD DEVIATION PER VARIABLE
results <- data.frame(measure=names(apply(total_data[3:563],2,mean)),mean=apply(total_data[3:563],2,mean), std=apply(total_data[3:563],2,sd))
row.names(results) <- 1:nrow(results)

write.table(results, "myresults.txt", sep="\t", row.names = FALSE)

# EXTRACT AVERAGE PER VARIABLE PER ACTIVITY AND PER SUBJECT
dffinal <- as.data.frame(tapply(total_data[,3],list(total_data$Subject, total_data$Activity),mean))
dffinal["VARIABLE"]=colnames(total_data)[3]
dffinal["SUBJECT"]=1:30

for(i in 4:563){
  dftemp <- as.data.frame(tapply(total_data[,i],list(total_data$Subject, total_data$Activity),mean))
  dftemp["VARIABLE"]=colnames(total_data)[i]
  dftemp["SUBJECT"]=1:30
  dffinal <- rbind(dffinal, dftemp)
}

row.names(dffinal) <- 1:nrow(dffinal)

write.table(dffinal, "myactivitysubjectaverages.txt", sep="\t", row.names = FALSE)