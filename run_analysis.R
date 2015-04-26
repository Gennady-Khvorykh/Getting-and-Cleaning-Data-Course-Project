# Getting and Cleaning Data at Coursera
# Course Project
# Student: Gennady Khvorykh

# We will download raw data sets into R programmaticaly. 
# For the purpose let us define the function that retrieves the files with data.
# Its argument is a character vector with 2 elements: 'test' and 'train'. 
# These elements are subdirectories where the data are stored.

getData <- function(type){
  dir <- sprintf("UCI HAR Dataset/%s/", type)
  files <- list.files(dir, pattern = "\\.txt$")
  path <- paste0(dir, files)
  datalist <- lapply(path, read.table) 
  Reduce(function(x,y){cbind(x,y)}, datalist)
}

# Get and merge raw data
dataset <- lapply(c("test", "train"), getData)
data <- rbind(dataset[[1]],dataset[[2]]) #10299 observations of 561 variables

# Get the list of features 
features <- read.table("UCI HAR Dataset/features.txt", stringsAsFactors = F)
features <- features$V2

# Add 'subject' and 'activity' as first and last elements to the feature list  
features <- append(features, "subject", 0)
features <- append(features, "activities", length(features))

# Add names to the data
names(data) <- features

# Find the column names containing 'mean', 'std', 'subject' and 'activities'. 
columns <- grep("mean|std|subject|activities", features) #81 columns

# Extract mean and standard deviation measurements, while keeping 'subject' and 'activities'
tidy <- data[, columns] #10299 observations of 81 variables

# Get the activities from the file and give them descriptive names
activities <- read.table("UCI HAR Dataset/activity_labels.txt")
activities <- activities[,2]
activities <- tolower(activities)
activities <- sub("_", " ", activities)

# Name the activities in data with decriptive activity names
tidy$activities <- sapply(tidy$activities, function(x) activities[x])

# Labels the data set with descriptive variable names
labels <- names(tidy)
labels <- gsub("\\(\\)", "", labels)
names(tidy) <- labels

# Create second tidy data set with the average of 
# each variable for each activity and each subject
tidy.agg <- aggregate(tidy[,2:80], by=list(subject = tidy$subject, activities = tidy$activities), mean)

# Save the tidy data thus obtained into file
write.table(tidy.agg, "tidy.txt", row.names = F)

# Output 
tidy.agg
