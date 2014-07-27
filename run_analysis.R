###########################
#Getting and Cleaning Data Project
###########################

# Read train data into R objects
subject_train = read.table("./train/subject_train.txt")
activity_train = read.table("./train/y_train.txt")
data_train = read.table("./train/X_train.txt")

# Read test data into R objects
subject_test = read.table("./test/subject_test.txt")
activity_test = read.table("./test/y_test.txt")
data_test = read.table("./test/X_test.txt")

###########################
# Step 1: Mereg train and test data to one data set
###########################

subject = rbind(subject_train, subject_test) 
activity = rbind(activity_train, activity_test)
data = rbind(data_train, data_test)

###########################
# Step 2: Extract mean and standard deviation for each measurement
###########################

# Read column names from features.txt file
features = read.table("./features.txt")
colnames = features[2]

# Assign column names to data 
colnames(data) = t(colnames)

# Subset data according to column name for only column of mean and std measurements
subdata = data[,grep("mean|std", colnames(data))]

###########################
# Step 3: Use descriptive activity names
###########################

# Read activity labels from activity_labels.txt
activity_labels = read.table("./activity_labels.txt")
activitylabel = data.frame(sapply(activity[,1], function(x) activity_labels[x,2]))

###########################
# Step 4: Appropriately label the data set with descriptive variable names
###########################

colnames(subject) = "Subject"
colnames(activitylabel) = "Activity"
str = colnames(subdata)

#change t to Time at the bigining
str = gsub("^t", "Time", str)

#change f to Freq at the bigining
str = gsub("^f", "Freq", str)

#remove ()
str = gsub("\\(\\)", "", str)
str = gsub("BodyBody", "Body", str)

colnames(subdata) = str

###########################
# Step 5: Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
###########################

#Mereg subject, activity, and data columns into one data frame
mergedata = cbind(subject, activitylabel, subdata)

#Summerize the data according to Subject & Activity columns by mean
finaldata = aggregate(mergedata[, 3:81], list(mdata$Subject, mdata$Activity), mean)

#Name subjct & Activity columns
colnames(finaldata)[1] = "Subject"
colnames(finaldata)[2] = "Activity"

#write the final data into a text file
write.table(finaldata, file = "MyData.txt", sep=",")





