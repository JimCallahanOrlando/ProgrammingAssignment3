# rankhospital.R
rankhospital <- function(state, outcome, num = "best") {
    ## Read outcome data
    ## Check that state and outcome are valid
    ### Check if num = "best", "worst" or is <= number of hospitals in state
    ### if num >= number of hospitals in state return(NA)
    ### NOTE number of hospitals is number in rankset and may vary by condition
    ### best = 1
    ### worst = number of hospitals in rankset
    ## Return hospital name in that state with the given rank
    ## 30-day death rate
    
    ### Jim Callahan
    ### August 25, 2015


    ## Read outcome data
    outcometable <- read.csv("data/outcome-of-care-measures.csv", 
                             colClasses = "character")
    
    ### Subset the columns (only columns relevant to this set of programs)
    deathrate <- outcometable[c(1, 2, 7, 11, 17, 23)]
    
    
    ### Rename column names
    NewColumnNames <- c("provider.id", "hospital.name", "state", 
                        "heart.attack", "heart.failure", "pneumonia" )
    
    colnames(deathrate) <- NewColumnNames
    #### Replace "Not Available" with NA
    deathrate$heart.attack  <- gsub("Not Available", NA, deathrate$heart.attack, fixed = TRUE)
    deathrate$heart.failure <- gsub("Not Available", NA, deathrate$heart.failure, fixed = TRUE)
    deathrate$pneumonia     <- gsub("Not Available", NA, deathrate$pneumonia, fixed = TRUE)
    
    deathrate$heart.attack   <- as.numeric(deathrate$heart.attack)
    deathrate$heart.failure  <- as.numeric(deathrate$heart.failure)
    deathrate$pneumonia      <- as.numeric(deathrate$pneumonia)
    
    
    ## Check that state and outcome are valid
    deathrate$state <- factor(deathrate$state)  
    statelist       <- levels(deathrate$state)
    outcomelist     <- c("heart attack", "heart failure", "pneumonia")
    rankwords       <- c("best", "worst")
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
    
    # Check num (for "best" or "worst)
    if ( is.character(num) )  {
        if (num %in% rankwords)  {
            # OK
        } else {
            stop("invalid rank word")
            return(NA)
        }
    }
    
    
    ## Return hospital name in that state with the given rank
    ## 30-day death rate
    ### HONOR CODE: http://www.statmethods.net/management/sorting.html
    
    ### Check if num = "best", "worst" or is <= number of hospitals in state
    ### if num >= number of hospitals in state return(NA)
    ### NOTE number of hospitals is number in rankset and may vary by condition
    ### best = 1
    ### worst = number of hospitals in rankset
    
    
    if (outcome == "heart attack") {
        rankset <- deathrate[deathrate$state == state, ]       # limit to state
        rankset <- rankset[order(rankset$heart.attack, rankset$hospital.name, na.last = NA), ]
        maxrank <- length(rankset$hospital.name)
        
        # This should be a function call, but I am too lazy today...
        if ( is.numeric(num) )  {
            if ( num <= maxrank ) {
                ranking <- num
            } else { 
                return(NA)
            }      
        }
        
        # Already checked that num is in rankwords (just after outcome check).
        if ( is.character(num) )  {
            if ( num == "best" )  { ranking <- 1 }
            if ( num == "worst" ) { ranking <- maxrank }
        }
        
        
        #      print(rankset$hospital.name[rank])
        rankhospital <- rankset$hospital.name[ranking]
        return(rankhospital)
    }
    
    
    if (outcome == "heart failure") {
        rankset <- deathrate[deathrate$state == state, ]       # limit to state
        rankset <- rankset[order(rankset$heart.failure, rankset$hospital.name, na.last = NA), ]
        maxrank <- length(rankset$heart.failure)
#      print(paste("maxrank is:", maxrank))
#      print(paste("is.numeric(num) is:", is.numeric(num) ))
#      print(paste("num is:", num ))
        
        # This should be a function call, but I am too lazy today...
        if ( is.numeric(num) )  {
            if ( num <= maxrank ) {
                ranking <- num
            } else { 
                return(NA)
            }      
        }
        
#      print(paste("ranking is:", ranking ))
        
        # Already checked that num is in rankwords (just after outcome check).
        if ( is.character(num) )  {
            if ( num == "best" )  { ranking <- 1 }
            if ( num == "worst" ) { ranking <- maxrank }
        }      
        
#      print(paste("ranking is still:", ranking ))
        
        #      print(rankset$hospital.name[rank])
        rankhospital <- rankset$hospital.name[ranking]
        return(rankhospital)
    }
    
    
    if (outcome == "pneumonia") {
        rankset <- deathrate[deathrate$state == state, ]       # limit to state
        rankset <- rankset[order(rankset$pneumonia, rankset$hospital.name, na.last = NA), ]
        maxrank <- length(rankset$hospital.name)
        
        # This should be a function call, but I am too lazy today...
        if ( is.numeric(num) )  {
            if ( num <= maxrank ) {
                ranking <- num
            } else { 
                return(NA)
            }      
        }
        
        # Already checked that num is in rankwords (just after outcome check).
        if ( is.character(num) )  {
            if ( num == "best" )  { ranking <- 1 }
            if ( num == "worst" ) { ranking <- maxrank }
        }      
        
        
        #      print(rankset$hospital.name[1])
        rankhospital <- rankset$hospital.name[ranking]
        return(rankhospital)
    }
}