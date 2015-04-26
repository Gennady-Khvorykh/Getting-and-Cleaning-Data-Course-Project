# Getting and Cleaning Data Course Project
A repository created for the Course Project within the Data Science Specialization at Coursera. Below is given the description of the [run_analysis.R](run_analysis.R) script. It takes the data sets from the working directory and produces a tidy data according to the assingment of the Course Project. 
## The list of the repository
* `README.md`
* `run_analysis.R` script
* `CodeBook.md` desribes the variables

## How does `run_analysis.R` work? 
1. The script downloads and merge raw data sets into R programmaticaly. For the purpose the function `getData()` is defined. 
  + Its argument is a character vector with 2 elements: `c("test", "train")`. As seen the elements of the vector correspond to the subfolders, where the data sets are placed. These subfolders are down the folder `UCI HAR Dataset`, where the above R script is located.
  + The function reads the conten of subfolders with `list.files()` 
  + The function reads and merge all data into list with two data sets called `dataset`. Then one data set called `data` is created. It has **10299 observations** of **563 variables**.  
2. The list of features is received from `features.txt`
3. Two elements are added to this list. These are `subject` and `activity`. They are added at the begining and at the end of the list. 
4. The elements in the list having `mean` or `std` are defined. The corresponding features are futher preserved for the final output. 
