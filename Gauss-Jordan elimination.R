# Solving a system of linear equations
# If there are any bugs found please let me know but this should be working for now

# The function that will perform Gauss-Jordan elimination (one column at a time).
# The function has been modified so that it will reorder the matrix when necessary as
# well as adjust itself when it finds a non-workable number.
colsimp <- function(mat, row, column){
  if (mat[row, column] == 0) 
    ({
    mat <- cbind(mat, 1)
    mat[, ncol(mat)] <- ifelse(mat[,column] == 0, 2, 1)
    mat <- mat[order(mat[,ncol(mat)]), ]
    mat <- mat[, -ncol(mat)]
    if (mat[row, column] == 0)
      ({
        if (all(mat[row, ] == 0)) stop("No more data to adjust")
        column <- which(mat[row, ] != 0)[1]
      })
  })
  if (mat[row, column] == 0) stop("needs adjustment")
  mat[row, ] <- mat[row, ] / mat[row, column]
  rows <- 1:nrow(mat)
  rows <- rows[-row]
  for (i in rows){
    mat[i, ] <- mat[i, ] - mat[i, column] * mat[row, ]
  }
  mat
}

# Load the matrix that is to be solved (this comes from a textbook)
mat <- matrix(c(5, -3, 2, 13,
                2, -1, -3, 1,
                4, -2, 4, 12), 3, 4, TRUE)
Solution <- matrix(c(1, 0, 0, 1,
                     0, 1, 0, -2,
                     0, 0, 1, 1), 3, 4, TRUE)

# Reduce the matrix to reduced row echelon form
for (i in 1:length(diag(mat))){
  mat <- colsimp(mat, i, i)
}
all.equal(mat, Solution) # TRUE
mat; Solution

# Testing the function out again
mat <- matrix(c(1, -1, 3, -2, 1,
                -2, 4, -3, 1, 0.5,
                3, -1, 10, -4, 2.9,
                4, -3, 8, -2, 0.6), 4, 5, TRUE)
Solution <- matrix(c(1, 0, 0, 0, -0.5,
                     0, 1, 0, 0, 0.2,
                     0, 0, 1, 0, 0.3,
                     0, 0, 0, 1, -0.4), 4, 5, TRUE)
for (i in 1:length(diag(mat))){
  mat <- colsimp(mat, i, i)
}
all.equal(mat, Solution) # TRUE
mat; Solution

# There are times when we must reorder the rows. This is easily done though.
mat <- matrix(c(1, 2, 4, 1, -1, 1,
                2, 4, 8, 3, -4, 2,
                1, 3, 7, 0, 3, -2), 3, 6, TRUE)
Solution <- matrix(c(1, 0, -2, 0, -3, 7,
                     0, 1, 3, 0, 2, -3,
                     0, 0, 0, 1, -2, 0), 3, 6, TRUE)
Solution # In reduced row echelon form (rref)
for (i in 1:length(diag(mat))){
  mat <- colsimp(mat, i, i)
}
all.equal(mat, Solution) # TRUE
mat; Solution
