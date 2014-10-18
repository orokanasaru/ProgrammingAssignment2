## This file implements a pair of methods used for caching the inverse 
## of a matrix

## This method takes a matrix and returns a pair of functions
## for getting the matrix and its inverse. The inverse is lazily cached

makeCacheMatrix <- function(x = matrix()) {
    inv <- NULL
    get <- function() x
    getInv <- function(...) {
        if (is.null(inv)) {
            inv <<- solve (x, ...)
        }
        inv
    }
    list (get = get, getInv = getInv)  
}

## This is a useless function required for the assignment.
## It simply calls the getInv method on the cacheMatrix passed in.

cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    x$getInv(...)
}
