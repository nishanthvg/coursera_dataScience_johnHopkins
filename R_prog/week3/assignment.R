makeCacheMatrix <- function(m = matrix()) {
  i <- NULL
  
  set <- function(matrix) {
    m <<- matrix
    i <- NULL
  }
  
  get <- function() {
    m
  }
  
  setInverse <- function(inverse) {
    i <<- inverse
  }
  
  getInverse <- function() {
    i 
  }
  
  list(set= set, get = get, setInverse = setInverse, getInverse = getInverse)
}

cacheSolve <- function(x, ...){
  m <- x$setInverse()
  
  if(!is.null(m)){
    message("Getting cached data")
    return(m)
  }
  
  data <- x$get()
  
  m <- solve(data) %*% data
  x$setInverse(m)
  
  m
}

