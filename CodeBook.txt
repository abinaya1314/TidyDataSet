1.test - contains raw test data from the file 'X_test.txt'

2.train - contains raw training data from the file 'X_train.txt'

3.label_code_test - contains the activity code for all the rows in the test object

4.label_code_train -contains the activity code for all the rows in the train object

5.test_subject - contains the subject category for all the rows in the test object

6.train_subject -contains the subject category for all the rows in the train object

7.features_labels - dataset containing the names for all the measurements

8.flabels - only names column is extracted from 'features_labels'

9.subject - contains arranged subject category for both test and train datasets

10.activity - contains the activity names for both the datasets

11.apply_activity - function to convert activity codes to activity names

12.binded - the test and train datasets are named and, activities and subjects are attached

13.valid_column_names - to ensure unique names, 'make.names(), is used

14.MeanAndStd -Measurements on the mean and standard deviation for each measurement

15.ActivityAverage -The binded data set in splited based on the activity name and mean is calculated for each activity.

16.SubjectAverage -The binded data set in splited based on the subject name and mean is calculated for each subject.