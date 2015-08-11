## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function


makeCacheMatrix <- function(x = matrix()) {
    InverseMatrix <- NULL
    list(
      get = function() x,
      setInverseMatrix = function(InverseMatrix0) InverseMatrix <<- InverseMatrix0,
      getInverseMatrix = function() InverseMatrix
    )
}

## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  
  m <- x$getInverseMatrix()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  data
  InverseMatrix <- solve(data)
  x$setInverseMatrix(InverseMatrix)
  InverseMatrix
}

N=99
NormalMatrix<-matrix(rnorm(N*N,mean=0,sd=1), N, N)
CachedMatrix=makeCacheMatrix(NormalMatrix)
system.time(cacheSolve(CachedMatrix))
system.time(cacheSolve(CachedMatrix))
