# Course-3-Project
This repository is created for the purpose of presenting results of final project of **Getting and Cleaning Data** course offered through Coursera. This repository contains the following files;

- *run_analysis.R* : The R script for the project.
- *TidyFinalData.txt* : The final tidy dataset, ie final output of the project.
- *Codebook.txt* : The code book describing the variables and the steps taken in the process of transforming raw data into final output.

The raw data comes from a Human Activity Recognition database built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors. 

30 volunteers in the age bracket of 19-48 years have been experimented in that each person performed six activities (walking, walking upstairs, walking downstairs, sitting, standing, laying) wearing a smartphone (Samsung Galaxy S II) on their waist. Using its embedded accelerometer and gyroscope, 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz are recorded. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

For the purpose of this project, the raw data is cleaned in a way that the training data and the test data are combined into a single dataset and only the variables which represent mean and standard deviation of the measurements detailed in the codebook are taken into account, with the name fullDataMeanStd appearing in the R script. The final output, *TidyFinalData*, is then obtained by reporting the average values of all the columns in fullDataMeanStd for each subject and activity.

More details on the datasets and scope of the experiment can be found [here.](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones/)
