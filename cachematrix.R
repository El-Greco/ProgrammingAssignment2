## The function "makeCacheMatrix" creates an object in the cahce and stores
## the inverse of a matrix that was passed as an argument.
## The function "cacheSolve" calculates the inverse of a matrix from the first function.

## This first function takes a matrix and stores an object for it's inverse in the cache. 
## If no argument is passed it creates an empty object. The function returns a list of subfunction.

makeCacheMatrix <- function(x = matrix()) {

        m <- NULL

# The function creates a local variable "m" that's set to NULL. It's the first
# object stored in the cache.

        set <- function(y) {
                x <<- y
                m <<- NULL
        }

# This subfunction can be called as a list item in order to replace the matrix
# we last passed as argument. The matrix in the cache "m" is erased and
# variable "x" is overwritten by the new matrix.

        get <- function() x

# This subfunction returns the matrix "x" we last passed as argument.

        setsolve <- function(solve) m <<- solve

# This subfunction calulates the inverse of the matrix we last passed as 
# argument, using the function "solve" and assigns the result to the cache ("m")

        getsolve <- function() m

#This subfunction returnes the contents of the cache.

        list(set = set, get = get,
             setsolve = setsolve,
             getsolve = getsolve)

# Finally the function returns a list of all four subfunctions defined above.
# We can then call them as individual items of that list so we can see the results
# On our screen.

}



## This function returns the inverse of the matrix "x".

cacheSolve <- function(x, ...) {

# This function calulates the inverse of a matrix using the function "solve".
# It then stores the result in variable "m".

        m <- x$getsolve()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }

# The function assigns to variable "m" amd checks the contents of the cache.
# If the cache is not empty it prints a message and returns the contents of the
# cache.

        data <- x$get()

# If the cache is empty then a local variable "data" is created with the contents
# of the matrix last passed as argument to function "makeCacheMatrix".

        m <- solve(data, ...)
        x$setsolve(m)
        m

# The function calculates the inverse of the matrix, assigns that inverse to
# variable "m" and stores it in the cache. It then returnes that inverse on
# the screen.

}
