## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function


makeCacheMatrix <- function(x = matrix()) {
  
  makeVector2 <- function(x = numeric()) {
    InverseMatrix <<- NULL
    list(
      get = function() x
      setInverseMatrix <- function(InverseMatrix0) InverseMatrix <<- InverseMatrix0
      getInverseMatrix <- function() InverseMatrix
    )
  }
}

## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}

N=10
matrix( rnorm(N*N,mean=0,sd=1), N, N) 
