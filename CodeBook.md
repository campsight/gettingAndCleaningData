# Code book for Coursera *Getting and Cleaning Data* course project

The code book summarizes the data for `tidy_data.txt`.

See the `README.md` file for background information.

The structure of the data set is described in the [Data](#data) section, the variables in the [Variables](#variables) section, and the transformations applied to obtain the data set in the [Transformations](#transformations) section.

## Data <a name="data"></a>

The `tidy_data.txt` data file is a text file, containing space-separated values.

The first row contains the names of the variables, the other rows the actual data. 

## Variables <a name="variables"></a>

Each row contains, for a given subject and activity, following averaged signal measurements:

### Identifiers <a name="identifiers"></a>

- `subject`

	Subject identifier, integer, ranges from 1 to 30.

- `activity`

	Activity identifier, string with 6 possible values: 
	- `WALKING`: subject was walking
	- `WALKING_UPSTAIRS`: subject was walking upstairs
	- `WALKING_DOWNSTAIRS`: subject was walking downstairs
	- `SITTING`: subject was sitting
	- `STANDING`: subject was standing
	- `LAYING`: subject was laying

- `averages`:

    -timeBodyAccelerometerMeanX
    -timeBodyAccelerometerMeanY
    -timeBodyAccelerometerMeanZ
    -timeBodyAccelerometerStandardDeviationX
    -timeBodyAccelerometerStandardDeviationY
    -timeBodyAccelerometerStandardDeviationZ
    -timeGravityAccelerometerMeanX
    -timeGravityAccelerometerMeanY
    -timeGravityAccelerometerMeanZ
    -timeGravityAccelerometerStandardDeviationX
    -timeGravityAccelerometerStandardDeviationY
    -timeGravityAccelerometerStandardDeviationZ
    -timeBodyAccelerometerJerkMeanX
    -timeBodyAccelerometerJerkMeanY
    -timeBodyAccelerometerJerkMeanZ
    -timeBodyAccelerometerJerkStandardDeviationX
    -timeBodyAccelerometerJerkStandardDeviationY
    -timeBodyAccelerometerJerkStandardDeviationZ
    -timeBodyGyroscopeMeanX
    -timeBodyGyroscopeMeanY
    -timeBodyGyroscopeMeanZ
    -timeBodyGyroscopeStandardDeviationX
    -timeBodyGyroscopeStandardDeviationY
    -timeBodyGyroscopeStandardDeviationZ
    -timeBodyGyroscopeJerkMeanX
    -timeBodyGyroscopeJerkMeanY
    -timeBodyGyroscopeJerkMeanZ
    -timeBodyGyroscopeJerkStandardDeviationX
    -timeBodyGyroscopeJerkStandardDeviationY
    -timeBodyGyroscopeJerkStandardDeviationZ
    -timeBodyAccelerometerMagnitudeMean
    -timeBodyAccelerometerMagnitudeStandardDeviation
    -timeGravityAccelerometerMagnitudeMean
    -timeGravityAccelerometerMagnitudeStandardDeviation
    -timeBodyAccelerometerJerkMagnitudeMean
    -timeBodyAccelerometerJerkMagnitudeStandardDeviation
    -timeBodyGyroscopeMagnitudeMean
    -timeBodyGyroscopeMagnitudeStandardDeviation
    -timeBodyGyroscopeJerkMagnitudeMean
    -timeBodyGyroscopeJerkMagnitudeStandardDeviation
    -timeBodyAccelerometerMeanX
    -timeBodyAccelerometerMeanY
    -timeBodyAccelerometerMeanZ
    -timeBodyAccelerometerStandardDeviationX
    -timeBodyAccelerometerStandardDeviationY
    -timeBodyAccelerometerStandardDeviationZ
    -timeBodyAccelerometerMeanFrequencyX
    -timeBodyAccelerometerMeanFrequencyY
    -timeBodyAccelerometerMeanFrequencyZ
    -timeBodyAccelerometerJerkMeanX
    -timeBodyAccelerometerJerkMeanY
    -timeBodyAccelerometerJerkMeanZ
    -timeBodyAccelerometerJerkStandardDeviationX
    -timeBodyAccelerometerJerkStandardDeviationY
    -timeBodyAccelerometerJerkStandardDeviationZ
    -timeBodyAccelerometerJerkMeanFrequencyX
    -timeBodyAccelerometerJerkMeanFrequencyY
    -timeBodyAccelerometerJerkMeanFrequencyZ
    -timeBodyGyroscopeMeanX
    -timeBodyGyroscopeMeanY
    -timeBodyGyroscopeMeanZ
    -timeBodyGyroscopeStandardDeviationX
    -timeBodyGyroscopeStandardDeviationY
    -timeBodyGyroscopeStandardDeviationZ
    -timeBodyGyroscopeMeanFrequencyX
    -timeBodyGyroscopeMeanFrequencyY
    -timeBodyGyroscopeMeanFrequencyZ
    -timeBodyAccelerometerMagnitudeMean
    -timeBodyAccelerometerMagnitudeStandardDeviation
    -timeBodyAccelerometerMagnitudeMeanFrequency
    -timeBodyAccelerometerJerkMagnitudeMean
    -timeBodyAccelerometerJerkMagnitudeStandardDeviation
    -timeBodyAccelerometerJerkMagnitudeMeanFrequency
    -timeBodyGyroscopeMagnitudeMean
    -timeBodyGyroscopeMagnitudeStandardDeviation
    -timeBodyGyroscopeMagnitudeMeanFrequency
    -timeBodyGyroscopeJerkMagnitudeMean
    -timeBodyGyroscopeJerkMagnitudeStandardDeviation
    -timeBodyGyroscopeJerkMagnitudeMeanFrequency
    
## Transformations <a name="transformations"></a>

The zip file containing the source data is located at [https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).

The R script `run_analysis.R` applies the following transformations to this data (the following steps are also described via comments in the R script itself):

1. Fetch the data (online) and unzip it
2. Read the data
3. Merge the training and the test set to create one data set.
4. Extract only the measurements on mean and standard deviations
5. Appropriately label the data
6. Create a tidy data set and write it to `tidy_data.txt`.
