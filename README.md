GettingDataProject1
===================

This is a descriptive text of the 'run_analysis.R' file and the output it produces.

===================

The file assumes that the activity recognition data found in

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

already reside in the user's working directory.

===================

When run, the code combines the training and test datasets of the aforementioned data and produces (writes) two output files (datasets):
1. myresults.txt
2. myactivitysubjectaverages.txt

===================

myresults.txt contains three variables:

1. "measure": a text variable detailing the 'feature' measured in the original activity recognition dataset
2. "mean": a numeric variable presenting the average (mean) of the specific feature in the combined training and test datasets
3. "std": a numeric variable presenting the standard deviation of the specific feature in the combined training and test datasets

====================

myactivitysubjectaverages.txt contains eight variables:

1. "LAYING" : a numeric variable presenting the average (mean) value for the "Laying" activity for any given individual and variable measured
2. "SITTING":  a numeric variable presenting the average (mean) value for the "Sitting" activity for any given individual and variable measured
3. "STANDING":  a numeric variable presenting the average (mean) value for the "Standing" activity for any given individual and variable measured
4. "WALKING":  a numeric variable presenting the average (mean) value for the "Walking" activity for any given individual and variable measured
5. "WALKING_DOWNSTAIRS":  a numeric variable presenting the average (mean) value for the "Walking Downstairs" activity for any given individual and variable measured
6. "VARIABLE": a text variable identifying the variable being measured
7. "SUBJECT": a numeric (integer) variable identifying the subject being measured (1:30)
