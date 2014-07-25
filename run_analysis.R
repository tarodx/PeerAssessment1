## Final goal: upload a tidy dataset with the average of each variable for each activity and each subject

## READ COMMON INFO

## Read column names
x_column <- read.table("features.txt", header=FALSE, sep="")

## Read activity labels
activity_labels <- read.table("activity_labels.txt", header= FALSE, sep="")

#############################################################################

## READ TEST DATA

## Read X_table
x_test <- read.table("test/X_test.txt", header=FALSE, sep="", dec=".")

        ## Add column names to the x_test table
        colnames(x_test) <- c(as.character(x_column[,2]))
        
## Read user labels 
y_test <- read.table("test/Y_test.txt", header=FALSE)

## Add the activity label for each user activity
y_test_labels <- merge(activity_labels, y_test, by.activity_labels="V1", by.y_test="V1")

        ## Modify column names
        colnames(y_test_labels) <- c("activity_id", "activity_desc")

## Read user info
subject_test <- read.table("test/subject_test.txt", header=FALSE)

        ## Modify column name
        colnames(subject_test) <- c("user_id")
        
## Merge the activity labels (y_labels) with the x_test data
test_table <- data.frame(subject_test, y_test_labels, x_test)

#############################################################################

## READ TRAINING DATA

## Read X_table
x_train <- read.table("train/X_train.txt", header=FALSE, sep="", dec=".")

## Add column names to the x_train table
colnames(x_train) <- c(as.character(x_column[,2]))

## Read user labels 
y_train <- read.table("train/Y_train.txt", header=FALSE)

## Add the activity label for each user activity
y_train_labels <- merge(activity_labels, y_train, by.activity_labels="V1", by.y_train="V1")

## Modify column names
colnames(y_train_labels) <- c("activity_id", "activity_desc")

## Read user info
subject_train <- read.table("train/subject_train.txt", header=FALSE)

## Modify column name
colnames(subject_train) <- c("user_id")

## Merge the activity labels (y_labels) with the x_train data
train_table <- data.frame(subject_train, y_train_labels, x_train)

#############################################################################

## 1. Merges the training and the test sets to create one data set. --> OK
global_data <- rbind(train_table, test_table)

## Extract from the global_data dataset, the mean and std columns for each variable

## Create a regular expression for matching columns
regexpr <- "user_id|activity_desc|.*mean!F.*|.*std().*"

## 2. Extracts only the measurements on the mean and standard deviation for each measurement. --> OK
global_data1 <- global_data[,c(grep(regexpr, c(colnames(global_data))))]

## 3. Uses descriptive activity names to name the activities in the data set --> OK (see below)

## 4. Appropriately labels the data set with descriptive activity names. --> OK (see below)

## 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
summary_data <- aggregate(global_data1, by = list(global_data1$user_id, global_data1$activity_desc), FUN=mean)

colnames(summary_data)[1] <- "id_user"
colnames(summary_data)[2] <- "id_activity"
summary_data <- summary_data[order(summary_data$id_user, summary_data$id_activity),]

## Remove unnecesary columns (user_id, activity_id)
summary_data <- subset(summary_data[,c(1,2,5:37)])

## Create new dataset with the average per user and activity
write.table(summary_data, "averages.txt", sep=" ", dec=".", col.names=TRUE, row.names=FALSE)    

