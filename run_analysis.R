setwd("/Documentation/Video Trainings/InProgress/Data Science Track/Getting and Cleaning Data/Project/GettingAndCleaningData");

activity_labels <- read.table("activity_labels.txt", header=FALSE, sep=" ",stringsAsFactors=FALSE)
features_labels <- read.table("features.txt",header=FALSE, sep=" ",stringsAsFactors=FALSE)
names(features_labels) <- c("id", "features")
x_train <- read.table("./train/X_train.txt")
x_test <- read.table("./test/X_test.txt")
y_train <- read.table("./train/y_train.txt")
y_test <- read.table("./test/y_test.txt")
subject_train <- read.table("./train/subject_train.txt")
subject_test <- read.table("./test/subject_test.txt")

data_train <- cbind.data.frame(subject_train, y_train, x_train)
data_test <- cbind.data.frame(subject_test, y_test, x_test)

data <- rbind(data_test, data_train)
names(data) <- c("subject_id", "activity", features_labels$features)
names(data)

mean_std_index <- sort(union(grep("mean", names(data), fixed=T), grep("std", names(data), fixed=T)))
data_mean_std <- data[, mean_std_index]

write.table(data_mean_std,"tidy.txt",sep=" ")

