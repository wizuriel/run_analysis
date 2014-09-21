<h1>Data Set Description</h1>
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 

<h1>files</h1>
<ul>
	<li>'features_info.txt': Shows information about the variables used on the feature vector.</li>
	<li>'features.txt': List of all features.</li>
	<li>'activity_labels.txt': Links the class labels with their activity name.</li>
	<li>'train/X_train.txt': Training set.</li>
	<li>'train/y_train.txt': Training labels.</li>
	<li>'test/X_test.txt': Test set.</li>
	<li>'test/y_test.txt': Test labels.</li>
	<li> 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. </li>
	<li>'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. </li>
	<li>'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. </li>
	<li>'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. </li>
</ul>

<h1>variables</h1>
<ul>
	<li>test.x: the test training set</li>
	<li>test.y: the train labels</li>
	<li>test.subjects: contains the subjects that participated in the test</li>
	<li>train.x: the training set</li>
	<li>train.y: the training labels</li>
	<li>train.subjects: contains the subjects in the training set</li>
	<li>activities: dataframe of the activities</li>
	<li>Features: dataframe of the features</li>
	<li>testData: dataframe of combined testdata (test.x, test.y and test.subject) with a column to identify this as test data</li>
	<li>trainData: dataframe of combined traindata (train.x, train.y and train.subject) with a column to identify this as training data</li>
	<li>df: dataframe of the combined testdata and traindata</li>
	<li>ids: character vector of the ID's to use in the melting</li>
	<li>datacol: character vector of the all the columns from DF except ID's and "Type"</li>
	<li>tidy: dataframe that contains the average of each variable for each activity and each subject.</li>
	
</ul>


<h1>Work</h1>
<h3>Init</h3>
making sure the user has the reshape2 package installed and loaded

<h3>getting data</h3>
if the data isn't downloaded/viewable I download the zip file and inzip it and create a text file to record the date.
```
download.file(fileUrl, destfile = "Dataset.zip")
```
might not work right on non-windows machines. Might need to change to:
```
download.file(fileUrl, destfile = "Dataset.zip", method = "curl")
```

<h3>loading data</h3>
I load the datasets into separate variables
<ul>
	<li>test.x</li>
	<li>test.y</li>
	<li>test.subjects</li>
	<li>train.x</li>
	<li>train.y</li>
	<li>train.subjects</li>
</ul>

<h3>naming activities</h3>
read the activity_labels.txt and set the test.y and train.y as a factor variable where the levels/labels use the activity labels

<h3>labelling dataset</h3>
reading the features and labeling the columns for test.x and train.x-fast. Also labelling the columns for the subjects and and activities

<h3>merging dataset</h3>
combing all the test and training into 1 dataframe. I've created a new column called Type to track if the observation was from the training or test dataset.

<h3>finding means and STD columns</h3>
going through the feature list to find which columns contain mean or std in the header and creating a mean_and_std df that contains just the means and std columns

<h3>tidying dataset</h3>
melting the big dataframe to create a new dataframe with the average of each variable for each activity and each subject.

<h3>cleanup</h3>
prints out the tidy dataframe as a txt file. 
