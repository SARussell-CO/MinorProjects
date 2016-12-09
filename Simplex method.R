# Intro ----
# This can be used to solve maximization or minimization problems in a system of linear
# equations. I am sure that there are cases that would cause these functions to fail but 
# they have worked great for solving the problems provided in the book. The purpose of 
# this was to reduce errors that came from hand manipulation of the matrices. I could not
# find a readily available package that would help in this area so I created something that
# would!
# The functions provide a simple function that helps solve systems of linear equations 
# given that the matrix that is passed to the function is written correctly. 
# Details of the Simplex method are not covered here.
# In general the output of the solver function should be easy to interpret. There will be
# a warning if there was a common error, the latest iteration of the matrix containing
# the system, the solutions to the system (sometimes you need to interpret the matrix,
# not covered here), and the last list of errors. In general if there is a 1 value
# under No negatives/Completion the function should have correctly solved the system.
# Further, errors is a slight misnomer: the method may correctly solve the system yet show
# an error for "No negatives/Completion" while the method solved the matrix successfully.
# The "Multiple solutions" error indicates that we should change the choice argument in the
# solver to check other possible solutions. The "No solution" error means there is no 
# solution to the system.

# These functions use the Simplex method as taught in the tenth edition of College Mathematics 
# for Business... by Barnett, Ziegler and Byleen, ISBN 0-13-143209-5.
# rm(list = ls()[-which(ls() %in% c("add_identity", "chooser", "solver", "changer"))])

# I think this is ready to go! There will be another script that has several tested matrices.

# Functions! ----
# Add identity matrix and add labels
add_identity <- function(mat){
  ident <- matrix(0, nrow(mat), nrow(mat))
  diag(ident) <- 1
  mat <- cbind(mat[ , 1:(ncol(mat) - 1)], ident, mat[ , ncol(mat)])
  rownames(mat) <- c(paste0("S", 1:(nrow(mat) - 1)), "P")
  colnames(mat) <- c(paste0("X", 1:(ncol(mat) - length(rownames(mat)) - 1)), rownames(mat), "")
  mat
}

# Choose element, rename rows/columns
chooser <- function(mat) {
  # We need to find the coordinates of a specific element
  l <- vector("list", 3)
  names(l) <- c("column", "row", "error")
  l$error <- rep(0, 3)
  names(l$error) <- c("Multiple solutions", "No negatives/Completion", "No solution")
  # Start by finding the column, note any errors
  column <- which(mat[nrow(mat), ] == min(mat[nrow(mat), ]))
  if(length(column) > 1) {
    l$error[1] <- 1
    if (min(mat[nrow(mat), column]) == 0) l$error[1] <- 0
  }
  if (all(mat[nrow(mat), column] >= 0)) {
    l$error[2] <- 1
  }
  # Find the row.
  row <- mat[, ncol(mat)] / mat[, column]
  if (is.null(dim(row))) {
    row <- row[-length(row)]
  } else {
    row <- row[-nrow(row), ]
  }
  row[which(row == Inf)] <- -1
  if (all(row <= 0)) {
    l$error[3] <- 1
  }
  row[row <= 0] <- max(row) + 1
  # If there are multiple alternatives
  if (is.null(dim(row))) {
  	y <- row[which(row == min(row))]
  } else {
  	y <- apply(row, 2, function(row){which(row == min(row))})
  	names(y) <- rownames(row)[y]
  }
  l$column <- as.list(names(column))
  l$row <- as.list(names(y))
  l
}

# Modify the matrix
changer <- function(mat, choice){
  l <- chooser(mat)
  if (length(l$column) > 1) {
    row <- l$row[choice]
    row <- as.character(row[[1]])
    column <- l$column[choice]
    column <- as.character(column[[1]])
  } else {
    row <- l$row
    row <- as.character(row[[1]])
    column <- l$column
    column <- as.character(column[[1]])
  }
  # paste0("row = ", row, " column = ", column)
  rownames(mat)[rownames(mat) == row] <- column
  mat[column, ] <- mat[column, ] / mat[column, column]
  for (i in 1:nrow(mat)){
    if (identical(mat[i, ], mat[column, ])) next
    mat[i, ] <- mat[i, ] - mat[i, column] * mat[column,  ]
  }
  mat
}

# Iterate over the matrix until complete
solver <- function(mat, choice = 1, minimize = TRUE){
  if(minimize == FALSE){
    mat <- t(mat)
    mat[nrow(mat), 1:(ncol(mat) - 1)] <- mat[nrow(mat), 1:(ncol(mat) - 1)] * -1
    mat[nrow(mat), ncol(mat)] <- 0
  }
  mat <- add_identity(mat)
  l <- chooser(mat)
  if (sum(l$error) > 0) {
    if (l$error["No negatives/Completion"] == TRUE) {
      warning("There are no negative values in the bottom row. Check your matrix.")
      return(mat)
    }
    if (l$error["Multiple solutions"] == TRUE) {
      warning("There are multiple possible solutions. Consider modifying the choice argument.")
    }
    if (l$error["No solution"]) {
      warning("There is no optimal solution to this system.")
      return(mat)
    }
  }
  mat <- add_identity(mat)
  repeat{
    mat <- changer(mat, choice)
    l <- chooser(mat)
    if (sum(l$error) > 0) {
      if (l$error["No negatives/Completion"] == TRUE) {
        break
      }
      if (l$error["Multiple solutions"] == TRUE) {
        warning("There are multiple possible solutions. Consider modifying the choice argument.")
      }
      if (l$error["No solution"]) {
        warning("There is no optimal solution to this system.")
        break
      }
    }
    if (min(mat[nrow(mat), ]) >= 0) break
    if (all(mat[-nrow(mat), l$column[[1]]] <= 0)) break
    if (is.null(l$row)) break
    if (is.null(l$column)) break
  }
	output <- vector("list", 3)
	names(output) <- c("Matrix", "Solutions", "Errors")
  output$Matrix <- mat
  if (minimize == TRUE) {
    output$Solutions <- paste(rownames(mat), "=", mat[, ncol(mat)])
  } else {
    output$Solutions <- "Interpret matrix"
  }
  if (l$error[3] == 1) output$Solutions <- "There are no solutions to this system"
  output$Errors <- chooser(mat)$error
  output
}
