This document explains all the steps performed to get the tidy dataset required.

Final goal: upload a tidy dataset with the average of each variable for each activity and each subject

Our final tidy dataset has 40 obs and 35 variables:

-- User id
"id_user" 

-- Activity id
"id_activity" 

-- Measurement (mean and standar deviation) for three axis (X, Y and Z)             
"tBodyAcc.std...Y"            
"tGravityAcc.std...Y"         
"tBodyAccJerk.std...Y"        
"tBodyGyro.std...Y"           
"tBodyGyroJerk.std...Y"  
"fBodyAcc.std...Y"         
"fBodyAccJerk.std...Y"     
"fBodyGyro.std...Y"        

"tBodyAcc.std...Z"           
"tGravityAcc.std...Z"        
"tBodyAccJerk.std...Z"       
"tBodyGyro.std...Z"          
"tBodyGyroJerk.std...Z"   
"fBodyAcc.std...Z"            
"fBodyAccJerk.std...Z"        
"fBodyGyro.std...Z"  

"tBodyAcc.std...X"         
"tGravityAcc.std...X"      
"tBodyAccJerk.std...X"     
"tBodyGyro.std...X"        
"tBodyGyroJerk.std...X"    
"fBodyAcc.std...X"           
"fBodyAccJerk.std...X"       
"fBodyGyro.std...X" 

-- Global measurements
"fBodyAccMag.std.."          
"fBodyBodyGyroJerkMag.std.."
"fBodyBodyAccJerkMag.std.."
"fBodyBodyGyroMag.std.."

"tBodyAccMag.std.."        
"tBodyGyroMag.std.."       
"tBodyAccJerkMag.std.."  
"tGravityAccMag.std.."        
"tBodyGyroJerkMag.std.." 


DESCRIPTION OF THE STEPS PERFORMED

step 1: READ COMMON INFO

	> Read column names (x_column <- "features.txt")
	> Read activity labels (activity_labels <- "activity_labels.txt")
	
step 2: READ TEST DATA
	> Read X_test table
	> Add column names to the x_test table (from x_column table)
	
	> Read Y_test table 
	> Add the activity label for each user activity (from activity_labels table): we made a merge between both activity_labels and y_test tables
	> Modify column names using "activity_id" and "activity_desc"

	> Read user info from "subject_test.txt" table
	> Modify column name setting "user_id"
	
	> Merge the activity labels (y_labels) with the x_test data and store it in a table called test_table

step 3: READ TRAIN DATA
	> Read X_train table
	> Add column names to the x_train table (from x_column table)

	> Read Y_train table
	> Add the activity label for each user activity (from activity_labels table): we made a merge between both activity_labels and y_train tables
	> Modify column names using "activity_id" and "activity_desc")
	
	> Read user info from "subject_train.txt" table
	> Modify column name setting "user_id"

	> Merge the activity labels (y_labels) with the x_train data and store it in a table called train_table

step 4: The key here is merge train and test dataset to create one unique datset called global_data (using rbind function)

step 5: The goal is extract from the global_data dataset, the mean and std columns for each variable. We will do this in the follow steps
	> 5.1. Create a regular expression for matching columns with the expression "user_id|activity_desc|.*mean!F.*|.*std().*"
	> 5.2. Extracts only the measurements on the mean and standard deviation for each measurement using the regular expression created before.

step 6: Creates a second, independent tidy data set with the average of each variable for each activity and each subject. To do this, we will use the aggregate function with the FUN=mean parameter
		After it, we change the name of the column to use better names ("id_user" and "id_activity") and order the dataset by user and activity.
		The last step is clean our tidy dataset removing unnecesary columns.
		
step 7: store our dataset in a file called "averages.txt"




