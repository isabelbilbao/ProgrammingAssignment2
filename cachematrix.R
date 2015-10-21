## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

  #These functions provide the base mechanisms for defining new functions in the R language.
  #Usage:
  #function( arglist ) expr
  #return(value)
  
  #the <<- operator which can be used to assign a value to an object in an 
  #environment that is different from the current environment

makeCacheMatrix <- function (x = matrix()) {
  inv <- NULL
  set <- function (y) {
    x <<- y
    inv <<- NULL
  }
  

  get <- function() x
  setinverse <- function (inverse) inv <<- inverse
  getinverse <- function () inv
  list (set=set, get=get, setinverse=setinverse, getinverse=getinverse)
}



cacheSolve <- function(x, ...) {
  inv <- x$getinverse()
  if(!is.null(inv)) {
    message("getting cached data")
    return(inv)
  }
  data <- x$get()
  inv <- solve(data)
  x$setinverse(inv)
  inv
}


