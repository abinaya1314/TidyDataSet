TIDY DATASET :

Given the data in a zip file, on extraction, the test file contains the details of test data and train file contains the details of training data.

1. Read the raw data from two different files in test and train directories into two different objects, and then merge them into a single object.

(The files "X_test.txt" and "X_train.txt" contain the measurement data for different variables listed in "features.txt" file.

"y_test.txt" and "y_train.txt" contains the code numbers from 1 to 6 which are described in "activity_labels.txt")

2. Read the activity names (for the code 1 to 6) and label names (for all the columns in the test and train dataset) and add them to the merged object that is formed in step 1.

(All the columns in test dataset and training dataset are named as described in label_string (that is, from "features.txt"). To link the activity names to all the rows in the test and training datasets, convert the codes in 'label_code_test' and 'label_code_train' to their respective names given in the "activity_labels.txt")

3. Only the measurements on the mean and standard deviation are extracted from the merged object.

4. Average is calculated for each variable in the dataset

5. Average is calculated for each subject in the dataset

6. Average is calculated for each activity
