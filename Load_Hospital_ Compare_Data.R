### FILE:     Load_Hospital_ Compare_Data.R
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

setwd("C:/Users/Jim/Documents/GitHub/ProgrammingAssignment3")
# setwd("~/GitHub/ProgrammingAssignment3")

# Read in Table 11
hospital <- read.table("data/hospital-data.csv", 
                     header = TRUE, sep = ",", quote = "\"", 
                     dec = ".", fill = TRUE, comment.char = "", 
                     na.strings = "NA",
                     check.names = TRUE,
                     stringsAsFactors = FALSE
                     )

NewColumnNames <- c("providerNumber", "name", "address1", "address2", "address3", 
                 "city", "State", "zip", "county", "phone", 
                 "type", "ownership", "emergencyservices")

# Rename column name
colnames(hospital) <- NewColumnNames

hospital$emergencyservices <- as.factor(hospital$emergencyservices)
summary(hospital$emergencyservices)

# Convert character Yes/No emergency services to logical TRUE/FALSE
# hospital$emergencyservices <- gsub("Not Available", NA, hospital$emergencyservices, fixed = TRUE)
# hospital$emergencyservices <- gsub("Yes", TRUE, hospital$emergencyservices, fixed = TRUE)
# hospital$emergencyservices <- gsub("No", FALSE, hospital$emergencyservices, fixed = TRUE)
# hospital$emergencyservices <- as.logical(hospital$emergencyservices)


# Read in Table 19
outcome <- read.csv("data/outcome-of-care-measures.csv", colClasses = "character")

outcome[, 11] <- as.numeric(outcome[, 11])
## You may get a warning about NAs being introduced; that is okay
hist(outcome[, 11])


# outcome <- read.table("data/outcome-of-care-measures.csv", 
#                       header = TRUE, sep = ",", quote = "\"", 
#                       dec = ".", fill = TRUE, comment.char = "", 
#                       na.strings = "NA",
#                       check.names = TRUE,
#                       stringsAsFactors = FALSE
#                      )

OutcomeOldColumnNames <- colnames(outcome)
OutcomeOldColumnNames

outcome$State <- factor(outcome$State)  ## Note State is capitalized in data set
statelist     <- levels(outcome$State)
statehcount   <- 

summary(outcome$State)


# MEASURES
# HospitalRate == Hospital
# Comparison   == Comparison.to.U.S..Rate
# Lower        == Lower.Mortality.Estimate
# Upper        == Upper.Mortality.Estimate

# Number.of.Patients
# Footnote

# UNITS
# DeathRate == Death..Mortality..Rates
# AdmitRate == Readmission.Rates
# NPatients == Number.of.Patients
# FootNotes == Footnote

# CONDITION(DISEASES)
# Heart.Attack
# Heart.Failure
# Pneumonia
# 





