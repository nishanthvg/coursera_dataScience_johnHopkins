outcomes <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
head(outcomes)

outcomes[,11] <- as.numeric(outcomes[,11])
hist(outcomes[,11])


best <- function(state, outcome) {
  #read the outcome data 
  outcomes = c("heart attack", "heart failure", "pneumonia")
  if(outcome %in% outcomes == FALSE) {
    stop("Invalid outcome")
  }
  
  data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  
  data <- data[c(2, 7, 11, 17, 23)]
  names(data)[1] <- "name"
  names(data)[2] <- "state"
  names(data)[3] <- "heart attack"
  names(data)[4] <- "heart failure"
  names(data)[5] <- "pneumonia"
  
  states <- data[, 2]
  states <- unique(states)
  if( state %in% states == FALSE ) {
    stop("invalid state")
  }
  
  data <- data[data$state==state & data[outcome] != 'Not Available', ]
  val <- data[,outcome]
  rowNum <- which.min(val)
  
  data[rowNum, ]$name
}
rankhospital <- function(state, outcome, num) {
  
  
  ## Read outcome data .csv file
  data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  data <- data[c(2, 7, 11, 17, 23)]
  names(data)[1] <- "name"
  names(data)[2] <- "state"
  names(data)[3] <- "heart attack"
  names(data)[4] <- "heart failure"
  names(data)[5] <- "pneumonia"
  
  ## All of the possible outcome strings
  outcomes = c("heart attack", "heart failure", "pneumonia")
  ## Check if outcome is one of the strings in outcomes
  if( outcome %in% outcomes == FALSE ) {
    stop("invalid outcome")
  }
  
  ## Validate the state string
  ## All of the possible states from the data
  states <- data[, 2]
  states <- unique(states)
  ## Check if state is one of the states in the data
  if( state %in% states == FALSE ) {
    stop("invalid state")
  }
  
  ## Validate the num value by checking if it is "best","worst", or a number.
  ## NOTE: If num was Boolean then num%%1 = 0
  if( num != "best" && num != "worst" && num%%1 != 0 ) {
    stop("invalid num")
  }
  
  ## Get only the rows with our state value    
  data <- data[data$state==state & data[outcome] != 'Not Available', ]
  
  ## Order the data by name and then outcome
  data[outcome] <- as.data.frame(sapply(data[outcome], as.numeric))
  data <- data[order(data$name, decreasing = FALSE), ]
  data <- data[order(data[outcome], decreasing = FALSE), ]
  
  ## Process the num argument to get the row index
  vals <- data[, outcome]
  if( num == "best" ) {
    rowNum <- which.min(vals)
  } else if( num == "worst" ) {
    rowNum <- which.max(vals)
  } else {
    rowNum <- num
  }
  
  ## Return hospital name in that state with lowest 30-day death rate
  data[rowNum, ]$name
}
rankall <- function(outcome, num = "best") {
  ## Read outcome data
  data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  data <- data[c(2, 7, 11, 17, 23)]
  names(data)[1] <- "name"
  names(data)[2] <- "state"
  names(data)[3] <- "heart attack"
  names(data)[4] <- "heart failure"
  names(data)[5] <- "pneumonia"
  
  ## Validate the outcome string
  outcomes = c("heart attack", "heart failure", "pneumonia")
  if( outcome %in% outcomes == FALSE ) stop("invalid outcome")
  
  ## Validate the num value
  if( num != "best" && num != "worst" && num%%1 != 0 ) stop("invalid num")
  
  ## Grab only rows with data in our outcome
  data <- data[data[outcome] != 'Not Available', ]
  
  ## Order the data
  data[outcome] <- as.data.frame(sapply(data[outcome], as.numeric))
  data <- data[order(data$name, decreasing = FALSE), ]
  data <- data[order(data[outcome], decreasing = FALSE), ]
  
  ## Helper functiont to process the num argument
  getHospByRank <- function(df, s, n) {
    df <- df[df$state==s, ]
    vals <- df[, outcome]
    if( n == "best" ) {
      rowNum <- which.min(vals)
    } else if( n == "worst" ) {
      rowNum <- which.max(vals)
    } else {
      rowNum <- n
    }
    df[rowNum, ]$name
  }
  
  ## For each state, find the hospital of the given rank
  states <- data[, 2]
  states <- unique(states)
  newdata <- data.frame("hospital"=character(), "state"=character())
  for(st in states) {
    hosp <- getHospByRank(data, st, num)
    newdata <- rbind(newdata, data.frame(hospital=hosp, state=st))
  }
  
  ## Return a data frame with the hospital names and the (abbreviated) state name
  newdata <- newdata[order(newdata['state'], decreasing = FALSE), ]
  newdata
}
