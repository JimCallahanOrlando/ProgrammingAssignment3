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
    
    ## Check that state and outcome are valid
    deathrate$state <- factor(deathrate$state)  
    statelist       <- levels(deathrate$state)
    outcomelist     <- c("heart attack", "heart failure", "pneumonia")
    
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
        rankset <- rankset[!is.na(deathrate$heart.attack), ]   # remove NA
        rankset <- rankset[order(rankset$heart.attack, rankset$hospital.name), ]
        print(rankset$hospital.name[1])
    }
    
    
    if (outcome == "heart failure") {
        rankset <- deathrate[deathrate$state == state, ]       # limit to state
        rankset <- rankset[!is.na(deathrate$heart.failure), ]  # remove NA
        rankset <- rankset[order(rankset$heart.failure, rankset$hospital.name), ]
        print(rankset$hospital.name[1])
    }
    
    
    if (outcome == "pneumonia") {
        rankset <- deathrate[deathrate$state == state, ]       # limit to state
        rankset <- rankset[!is.na(deathrate$pneumonia), ]      # remove NA
        rankset <- rankset[order(rankset$pneumonia, rankset$hospital.name), ]
        print(rankset$hospital.name[1])
    }
   
}