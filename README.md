In this folder you can find the "run_analysis.R" file. This file works with the "Human Activity Recognition Using Smartphones" data set. In the next lines, a description of the code will be done.

- Step 1: read common info from the "UCI HAR Dataset" directory:
	> Read column names
	
	> Read activity labels
	
- Step 2: read TEST data
	> Read the content of the "x_test" file and add the column names from the "x_column" file
		
		output: "x_test" dataset
	
	> Read user labels from the "y_test" file and after this, it will create a table with the activity name for each user activity id.
	
		output: "y_test_labels"
		
	> Read user info from the "test/subject_test.txt" file
	
		output: "subject_test"
		
	> At the end, create the test_table dataset by merge the three dataset "subject_test",  "y_test_labels" and "x_test".	
	
		output: "test_table"
		
- Step3: read TRAIN data

	* It will be the same as with the test data explained before.
	
		output: "train_table"
	
- Step4: merge train and test dataset.

		output: "global_data"

- Step5: Work with the "global_data" dataset.			
		5.1. Extract from the global_data dataset, the mean and std columns for each variable
		
		5.2. Uses descriptive activity names to name the activities in the data set
		
		5.3. Appropriately labels the data set with descriptive activity names. 

		5.4. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
		
		output: "averages.txt" -> this file will contain the final result of the exercise.


