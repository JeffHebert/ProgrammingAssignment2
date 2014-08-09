## This code creates two functions for storing and recalling the inverse of a matrix
#  Created by Jeff Hebert on 8/9/2014 based on example code from Coursera R Programming by
#  Roger D. Peng, PhD, Jeff Leek, PhD, Brian Caffo, PhD. See class.coursera.org/rprog-006

# To use these functions, first run the makeCacheMatrix() function on a square matrix.
# The object is a list of functions to access stored data related to the matrix.
# Note that you must store this list object in a variable to be able to access the data later.
# When ready to use the results, run the cacheSolve() function on the list object.
# To store data for multiple matrices, create an object for each unique matrix.

# The function makeCacheMatrix creates a list object containg the functions which will
# save a copy of the matrix and it's inverse in the global environment.


makeCacheMatrix <- function(matrix = matrix()) {
    # Initialize matrix inverse - needed for get_inverse function
    matrix_inverse <- NULL
    # Create functions to set and return data
    set_matrix <- function(y) matrix <<- y
    get_matrix <- function() matrix
    set_inverse <- function(inverse) matrix_inverse <<- inverse
    get_inverse <- function() matrix_inverse
    # Create list of functions to return as result of this function
    make_function <- list(set_matrix = set_matrix, 
                          get_matrix = get_matrix,
                          set_inverse = set_inverse,
                          get_inverse = get_inverse)
    return(make_function)
}


# The function cacheSolve checks for a stored answer for this matrix. If cached data exists,
# the function returns the inverse of the data. Otherwise the function calculates the
# inverse matrix, stores the results, and returns the result.

cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of matrix processed by 'x'
    # x must be an object created by makeCacheMatrix
    # Check for cached data
    answer <- x$get_inverse()
    if(is.null(answer)) {
        # Cached data not found, calculate and store inverse
        data <- x$get_matrix()
        message("calculating matrix inverse and storing data")
        answer <- solve(m)
        x$set_inverse(answer)
        return(answer)
    } else {
        # Cached data exists, return cached data
        message("getting cached data")
        return(answer)
    }
}


