
## The function create a cachematrix. CacheMatrix can generate a matrix with cache.
## The computed inverseMatrix will be cached, therefore the inverseMatrix can be obtained directly in the next time


## Take a matrix arguments and combine and then return a CachedMatrix.

makeCacheMatrix <- function(x = matrix()) {
    InverseMatrix <- NULL
    list(
      get = function() x,
      setInverseMatrix = function(InverseMatrix0) InverseMatrix <<- InverseMatrix0,
      getInverseMatrix = function() InverseMatrix
    )
}

## Take a matrix, compute the inverseMatrix and store the inverserMatrix.


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

##the code is tested as below
##a 2500*2500 matrix is created for testing purpose.
N=2500
NormalMatrix<-matrix(rnorm(N*N,mean=0,sd=1), N, N)

##the test matrix is converted to cachematrix by makeCacheMatrix(...) function
CachedMatrix=makeCacheMatrix(NormalMatrix)

##calcute the InverseMatrix by cacheSolve(...) funcation. (Note* system.time(expr) funcation return CPU (and other) times that expr used, str(object, ...) compactly display the internal structure of an R object.)
system.time(InverseMatrixresult<-cacheSolve(CachedMatrix))
str(InverseMatrixresult)

##calcute the InverseMatrix by cacheSolve(...) funcation again.
system.time(cacheSolve(CachedMatrix))
str(InverseMatrixresult)
