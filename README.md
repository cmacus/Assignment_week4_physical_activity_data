# Assignment_week4_physical_activity_data

## Prerequisites
. The code works only if the unzipped folder 'UCI HARD dataset' is in teh same folder as run_analysis.R.
. dplyr package should be installed

## How it works
. The training data and test data files (X_train.txt and X_test.txt) are read in dataframes.
. The list of subjects is read from subjects_train and subjects_test.txt
. The list of activities is read similarly.
. An incremental counter field (RecordingID) is added to both subjects and activities table, which will serve as a key to merge the two.
. The two tables subjects and activities are merged.
. The activity labels are read from activity_labels.txt
. The recording labels are read from features.txt
. A Recording ID field is added to both test and train dataset
. The test dataset, subjects and activities are merged with key=RecordingID
. The train dataset is merged similarly
. The test and train dataset are joined vertically to give a final dataset.
. This final dataset is filtered by activity and subject id in a loop.
. For each subject and activity, column means for all recordings are calculated and stored in a vector.
. The vectors are joined in the output tidy.txt
