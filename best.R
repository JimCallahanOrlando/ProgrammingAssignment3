# best.R
best <- function(state, outcome) {
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
    
    deathrate$heart.attack   <- as.numeric(deathrate$heart.attack)
    deathrate$heart.failure  <- as.numeric(deathrate$heart.failure)
    deathrate$pneumonia      <- as.numeric(deathrate$pneumonia)
    
    head(deathrate)
    tail(deathrate)
    
    ## Check that state and outcome are valid
    deathrate$state <- factor(deathrate$state)  
    statelist       <- levels(deathrate$state)
    outcomelist     <- c("heart attack", "heart failure", "pneumonia")
#    deathrate$hospital.name   <-factor(deathrate$hospital.name)
    
    # Check state
    if (state %in% statelist)  {
        # OK
    } else {
        stop("invalid state")
        return(NA)
    }
    
    # Check outcome
    if (outcome %in% outcomelist)  {
        # OK
    } else {
        stop("invalid outcome")
        return(NA)
    }
    
    ## Return hospital name in that state with lowest 30-day death
    ## rate
    # http://www.statmethods.net/management/sorting.html
    
    if (outcome == "heart attack") {
        rankset <- deathrate[deathrate$state == state, ]       # limit to state
        rankset <- rankset[order(rankset$heart.attack, rankset$hospital.name, na.last = NA), ]
#      print(rankset$hospital.name[1])
        best <- rankset$hospital.name[1]
        return(best)
    }
    
    
    if (outcome == "heart failure") {
        rankset <- deathrate[deathrate$state == state, ]       # limit to state
        rankset <- rankset[order(rankset$heart.failure, rankset$hospital.name, na.last = NA), ]
#      print(rankset$hospital.name[1])
        best <- rankset$hospital.name[1]
        return(best)
    }
    
    
    if (outcome == "pneumonia") {
        rankset <- deathrate[deathrate$state == state, ]       # limit to state
        rankset <- rankset[order(rankset$pneumonia, rankset$hospital.name, na.last = NA), ]
#      print(rankset$hospital.name[1])
        best <- rankset$hospital.name[1]
        return(best)
    }
   
}