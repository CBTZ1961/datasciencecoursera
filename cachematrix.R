## makeCachematrix stores the inverse of a matrix in it's local object memory. Once an object of type makeCacheMatrix has been 
## initiated, the data can be retrived from the instance of the object using the functions get and getinv. a new matrix can be
## set into the instance with the set function and the inverse is getting retrived by the setinv function


makeCacheMatrix <- function(x = matrix()) {
       imatrix <- NULL
       set <- function(y){
           x <<- y
           imatrix <<- NULL
       }
       get <- function() x
       setinv <- function(solve)  imatrix <<- solve 
       getinv <<- function() imatrix
       list(set = set, get = get, setinv = setinv, getinv = getinv)
}


## cachSolve is returning the invere of a matrix by checking the passed makeCachematrix. If the inverse of the matrix exists it
## returns that. If not, it calculates the inverse and sets it into the cache of the makeCachematrix for futher reuse

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
       imatrix <- x$getinv()
       if (!is.null(imatrix)){
         message('getting from cache')  #can matrix have changed? x$get() == 
         return(imatrix)
       }
       data <- x$get()
       imatrix <- solve(data)
       x$setinv(imatrix)
       imatrix
}
