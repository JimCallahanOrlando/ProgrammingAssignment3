### FILE:     Get_Hospital_ Compare_Data.R
### PURPOSE:  Download zip file of wearable devices data.
### AUTHOR:   James B. Callahan (Jim)
### DATE:     August 24, 2015
###
### TRACK:    Coursera: Data Scientist Certification Track
### COURSE:   Getting and Cleaning Data -- Class Project
###
### LANGUAGE: R statistical programming language
###           R version 3.2.2 (2015-08-14) -- "Fire Safety"
###           Copyright (C) 2015 The R Foundation for Statistical Computing
###           Platform: x86_64-w64-mingw32/x64 (64-bit)
###
### IDE:      RStudio
###           Version 0.99.463 – © 2009-2014 RStudio, Inc.
###
### PLATFORM: Microsoft Windows 7 Professional [Version 6.1.7601]

### descr has the file.head function for dumping the first few lines of a file without interpretation
### require(descr)

### If you comment out this specific setwd(); use the getwd() to note what directory you are in.
setwd("~/GitHub/ProgrammingAssignment3")

### Where am I? (in the directory tree -- useful for debugging file string)
getwd()

## Create /data directory if it doesn't already exist.
if (!file.exists("data")) {
    dir.create("data")
}

### Get Assignment
url <- "https://d396qusza40orc.cloudfront.net/rprog%2Fdoc%2FProgAssignment3.pdf"
download.file(url,'ProgAssignment3.pdf', mode="wb")

### Download "ProgAssignment3-data.zip"
# url <- "https://d396qusza40orc.cloudfront.net/rprog%2Fdata%2FProgAssignment3-data.zip"
# download.file(url,"/data/ProgAssignment3-data.zip", mode="wb")


### Unzip the data file
# unzip("/data/ProgAssignment3-data.zip", 
#      overwrite = TRUE, exdir = ".", unzip = "internal", setTimes = TRUE)


### Data file should be downloaded and unzipped; ready for next program read into R.
### End of: Get_Wearable_Data.R