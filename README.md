<h1>What this repository contains?</h1>
This repository contains the R code for the assignment "Getting and Cleaning Data Course Project" from the Coursera class "Getting and Cleaning Data".

<h1>assumptions</h1>
This script was made on a Windows 7 machine. Might not work under different operation systems (mainly the data download since didn't use "curl")

<h1>What happens</h1>
This script will download the UCI HAR Dataset and create a tidy dataset (printed as a txt file called tidy) that lists the mean for each subject/activity per measurment. 

<h1>How to run?</h1>
To run the script all you need to do is download and run the r code. The script will check if you have the data and if not attempt to download it. If the file failes to download/unzip you can manually get it: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip and just unzip the file (UCI HAR Dataset) in the same folder as the r script. 

