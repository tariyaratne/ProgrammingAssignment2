##The overall aim of this excercise is to make use of the "cache" assignment operator in R when computing
## an Inverse Matrix of a square matrix, such that if a <- matrix(1:4,2)
##> a$get()
##   [,1] [,2]
##[1,]  1    3
##[2,]  2    4
##> cacheSolve(a)
##   [,1] [,2]
##[1,] -2  1.5
##[2,]  1 -0.5
##> cacheSolve(a)          > a$getInverse()   > a$getInverse() %*% a$get()
##getting cached data         [,1] [,2]             [,1] [,2] 
##   [,1] [,2]            [1,]  -2  1.5       [1,]   1    0   
##[1,] -2  1.5            [2,]   1 -0.5       [2,]   0    1
##[2,]  1 -0.5            


## **1st Function**
## This function attempts the cache (i.e. store in global env.) a particular matrix "x" as matrix "m"
## it also creates 4 functions:
##     1) a function 'get' to return matrix x when prompted (i.e. x$get()); 
##     2) a function 'set' to create a matrix x when prompted (i.e. x$set(matrix(.....)))
##     3) a function  'getInverse' to return inverse of x when prompted (i.e. x$getInverse())
##     4) a function 'setInverse' to create a new inverse matrix when prompted (i.e. x$setInverse(matrix(..)))

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setInverse <- function(Inverse) m <<- Inverse
  getInverse <- function() m
  list(set = set, get = get,
       setInverse = setInverse,
       getInverse = getInverse)
}

## **2nd Function**
## This function computes the Inverse Matrix of  "m" (a square matrix) if not already cached in memeory. 
## If cached (stored) in memory it returns the Inverse Matrix of x without repeating the computation.

cacheSolve <- function(x, ...) {
  m <- x$getInverse()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setInverse(m)
  m
  
}


