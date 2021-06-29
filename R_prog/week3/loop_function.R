#lapply - returns a list of new values 
#arguments - list or matrix , function - iterate through the list and evaluate the elements for the given function 
x <- 1:4
lapply(x, mean)

lapply(x, function(ele) ele = ele +1)

lapply(x, runif) #creates a uniform random variables - runif 
lapply(x, runif, min = 0, max = 9) #creates a uniform random variables - runif 

x1 <- list(a = 1:4, b = rnorm(10), c = rnorm(20))
sapply(x1, mean) # returns a data type according to the result obtained 
#refined version of lapply


#apply - used to evaluate function over margin of array 
x2 <- matrix(rnorm(200), 20, 10)
colSum = apply(x2,2, sum)
rowSum = apply(x2, 1, sum)
colMean = apply(x2, 2, mean)
rowMean = apply(x2,1,mean)

  #ANOTHER EXAMPLE
apply(x2,1,quantile,probs = c(0.25,0.75)) #finding the 25 and the 75th percentiel forevery row 

#mapply - helps in itrating through the arguments 
noise <- function(n, mean, sd) {
  rnorm(n,mean,sd)
}

#say we have an array of n and array of mean for which we need norm 
mapply(noise, 1:5,1:5,2)

#tapply
x4 <- c(rnorm(10), runif(10), rnorm(10,1))
f1 <- gl(3,10)

tapply(x4,f1,mean)
tapply(x4, f1, mean, simplify = FALSE)#returns a list


