#read features
feature <- read_delim("C:/Users/oakbulut/Documents/Coursera/getdata_projectfiles_UCI_HAR_Dataset/features.txt", " ", col_names = F)
#create a feature vector to name columns of both training and test datasets
featurevector<-pull(.data = feature , var = 2)
#read training dataset
x_train <- read_table("C:/Users/oakbulut/Documents/Coursera/getdata_projectfiles_UCI_HAR_Dataset/train/X_train.txt", col_names = featurevector)
#read training dataset headers
y_train <- read_table("C:/Users/oakbulut/Documents/Coursera/getdata_projectfiles_UCI_HAR_Dataset/train/y_train.txt", col_names = "Activity Type", col_types = cols(col_factor(levels = 1:6)))
#read codes for subjects
subject_train <- read_table("C:/Users/oakbulut/Documents/Coursera/getdata_projectfiles_UCI_HAR_Dataset/train/subject_train.txt", col_names = "subject")
#create training data set by combining above
trainingData <- bind_cols(subject_train,y_train, x_train)
#add a variable named source indicating training data set
trainingData2<-mutate(trainingData,source="Training Data")
#read testing dataset
x_test <- read_table("C:/Users/oakbulut/Documents/Coursera/getdata_projectfiles_UCI_HAR_Dataset/test/X_test.txt", col_names = featurevector)
#read testing dataset headers
y_test <- read_table("C:/Users/oakbulut/Documents/Coursera/getdata_projectfiles_UCI_HAR_Dataset/test/y_test.txt", col_names = "Activity Type", col_types = cols(col_factor(levels = 1:6)))
#read codes for subjects
subject_test <- read_table("C:/Users/oakbulut/Documents/Coursera/getdata_projectfiles_UCI_HAR_Dataset/test/subject_test.txt", col_names = "subject")
#create testing data set by combining above
testingData <- bind_cols(subject_test,y_test, x_test)
#add a variable named source indicating testing data set
testingData2<-mutate(testingData,source="Testing Data")
#combine both datasets into one
fullData<-bind_rows(trainingData2,testingData2)
#Extract only the measurements on the mean and standard deviation for each measurement.
fullDataMeanStd<-fullData[,grepl(pattern = "mean()",x = names(fullData),fixed=T) | grepl(pattern = "std()",x = names(fullData),fixed=T) |grepl(pattern = "source",x = names(fullData),fixed=T) | grepl(pattern = "subject",x = names(fullData),fixed=T) | grepl(pattern = "Activity Type",x = names(fullData),fixed=T)]
#Read activity names
activity_names <- read_delim("C:/Users/oakbulut/Documents/Coursera/getdata_projectfiles_UCI_HAR_Dataset/activity_labels.txt", " ", col_names = F)
#create an activity vector to name name activities
activityvector<-pull(.data = activity_names , var = 2)
#Use the above descriptive activity names to name the activities in the data set
levels(fullDataMeanStd$`Activity Type`)<-activityvector
#Label the data set with descriptive variable names.
names(fullDataMeanStd)[2] = "activity"
names(fullDataMeanStd)<-gsub("\\(\\)", "", names(fullDataMeanStd))
names(fullDataMeanStd)<-gsub("^t", "Time", names(fullDataMeanStd))
names(fullDataMeanStd)<-gsub("^f", "Frequency", names(fullDataMeanStd))
names(fullDataMeanStd)<-gsub("Acc", "Accelerometer", names(fullDataMeanStd))
names(fullDataMeanStd)<-gsub("Gyro", "Gyroscope", names(fullDataMeanStd))
names(fullDataMeanStd)<-gsub("Mag", "Magnitude", names(fullDataMeanStd))
names(fullDataMeanStd)<-gsub("-X", "AxisX", names(fullDataMeanStd))
names(fullDataMeanStd)<-gsub("-Y", "AxisY", names(fullDataMeanStd))
names(fullDataMeanStd)<-gsub("-Z", "AxisZ", names(fullDataMeanStd))
names(fullDataMeanStd)<-gsub("-mean", "Mean", names(fullDataMeanStd))
names(fullDataMeanStd)<-gsub("-std", "StandardDeviation", names(fullDataMeanStd))
#Create a second, independent tidy data set with the average of each variable for each activity and each subject.
TidyFinalData <- fullDataMeanStd %>% group_by(subject, activity) %>% summarise_at(vars(names(fullDataMeanStd)[3]:names(fullDataMeanStd)[68]),mean,na.rm = T)
#Write the tidy final dataset into a txt file
write.table(TidyFinalData, "TidyFinalData.txt", row.name=FALSE)