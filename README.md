# TidyDataSet

The files "X_test.txt" and "X_train.txt" contain the measurement data
for different variables listed in "features.txt" file.

"y_test.txt" and "y_train.txt" contains the code numbers from 1 to 6 
which are described in "activity_labels.txt"

All the columns in test dataset and training dataset are named 
as described in label_string (that is, from "features.txt")

To link the activity names to all the rows in the test and training datasets,
convert the codes in 'label_code_test' and 'label_code_train' to their respective
names given in the "activity_labels.txt"

The test and training data sets are loaded into the objects 'test' and 'train' respectively.

Both are binded to form an object 'binded'

The names are linked to each column of the 'binded' object 

Measurements on the mean and standard deviation for each measurement is extracted and stored in an object 'MeanAndStd'

The binded data set in splited based on the activity name and mean is calculated for each activity. It is stored in 'ActivityAverage'.

The binded data set in splited based on the subject name and mean is calculated for each subject. It is stored in 'SubjectAverage'.

The tidy data set is stored in the object 'MeanAndStd'
