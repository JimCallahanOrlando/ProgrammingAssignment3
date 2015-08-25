# ListTXHospitals.R
# to find "Fort Duncan" in alphabetical list.

## Read outcome data
outcometable <- read.csv("data/outcome-of-care-measures.csv", 
                         colClasses = "character")

### Subset the columns (only columns relevant to this set of programs)
deathrate <- outcometable[c(1, 2, 7, 11, 17, 23)]


# Rename column names
NewColumnNames <- c("provider.id", "hospital.name", "state", 
                    "heart.attack", "heart.failure", "pneumonia" )

colnames(deathrate) <- NewColumnNames

# Replace "Not Available" with NA
deathrate$heart.attack  <- gsub("Not Available", NA, deathrate$heart.attack, fixed = TRUE)
deathrate$heart.failure <- gsub("Not Available", NA, deathrate$heart.failure, fixed = TRUE)
deathrate$pneumonia     <- gsub("Not Available", NA, deathrate$pneumonia, fixed = TRUE)

deathrate <- deathrate[deathrate$state == "TX", ]
deathrate <- deathrate[order(deathrate$hospital.name, na.last = NA), ]
deathrate[deathrate$provider.id == 450092, ]