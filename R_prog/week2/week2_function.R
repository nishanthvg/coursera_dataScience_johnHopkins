##functions 
add2 <- function(x,y) {
  x+y
}

aboveN <- function(x,n = 10) {
  index <- x > n
  x[index]
}

##mean of every col in a matrix
meanOfMatrix <- function(x, removeNA = TRUE) {
  nc <- ncol(x)
  means <- numeric(nc)
  for(i in 1:nc) {
    means[i] <- mean(x[ ,i])
  }
  means
}