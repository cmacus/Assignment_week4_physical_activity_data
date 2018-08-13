# Assignment_week4_physical_activity_data

## Prerequisites
* The code works only if the unzipped folder 'UCI HARD dataset' is in teh same folder as run_analysis.R.
* dplyr package should be installed

## How it works
1. The training data and test data files (X_train.txt and X_test.txt) are read in dataframes.
2. The list of subjects is read from subjects_train and subjects_test.txt
3. The list of activities is read similarly.
4. An incremental counter field (RecordingID) is added to both subjects and activities table, which will serve as a key to merge the two.
5. The two tables subjects and activities are merged.
6. The activity labels are read from activity_labels.txt
7. The recording labels are read from features.txt
8. A Recording ID field is added to both test and train dataset
9. The test dataset, subjects and activities are merged with key=RecordingID
10. The train dataset is merged similarly
11. The test and train dataset are joined vertically to give a final dataset.
12. This final dataset is filtered by activity and subject id in a loop.
13. For each subject and activity, column means for all recordings are calculated and stored in a vector.
14. The vectors are joined in the output tidy.txt
