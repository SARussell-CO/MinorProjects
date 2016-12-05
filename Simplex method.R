# This can be used to solve maximization problems with problem constraints of the form <=.
# This is using the simplex method as taught in the tenth edition of College Mathematics for
# Business... by Barnett, Ziegler and Byleen, ISBN 0-13-143209-5.

# Add identity matrix and add labels
ai <- function(mat){
  ident <- matrix(0, nrow(mat), ncol(mat))
  diag(ident) <- 1
  mat <- cbind(mat[ , 1:(ncol(mat) - 1)], ident, mat[ , ncol(mat)])
  rownames(mat) <- c(paste0("S", 1:(nrow(mat) - 1)), "P")
  colnames(mat) <- c(paste0("X", 1:(ncol(mat) - length(rownames(mat)) - 1)), rownames(mat), "")
  mat
}

# Choose element, rename rows/columns
ce <- function(mat){
  x <- which(mat[nrow(mat), ] == min(mat[nrow(mat), ]))
  calc <- mat[, ncol(mat)] / mat[, x]
  calc <- calc[-length(calc)]
  y <- which(calc == min(calc))
  l <- vector("list", 2)
  names(l) <- c("X", "Y")
  l$X <- x
  l$Y <- y
  l
}

# Modify the matrix
ch <- function(mat){
  l <- ce(mat)
  x <- l$X
  y <- l$Y
  rownames(mat)[y] <- names(x)
  mat[y, ] <- mat[y, ] / mat[y, x]
  for (i in 1:nrow(mat)){
    if (identical(mat[i, ], mat[y, ])) next
    mat[i, ] <- mat[i, ] - mat[i, x] * mat[y,  ]
  }
  mat
}

# Iterate over the matrix until complete
solver <- function(mat){
  repeat{
    mat <- ch(mat)
    if (min(mat[nrow(mat), ]) >= 0) break
    if (all(mat[-nrow(mat), ce(mat)$X] <= 0)) break
  }
  mat
}

# Create the matrix of constraints and then modify it
mat <- matrix(c(.5, .5, 1, 30,
                60000, 60000, 80000, 3200000,
                4000, 3000, 4000, 180000,
                -17000, -18000, -24000, 0), 4, 4, TRUE)
mat <- ai(mat)

# Let's look at the original matrix and the solved matrix and compare them:
mat; solver(mat)

# The text asks what the effects will be on the model if one of the variables changes. I
# will simply change that value and rerun the solver!
mat <- matrix(c(.5, .5, 1, 30,
                60000, 60000, 80000, 3200000,
                4000, 3000, 4000, 180000,
                -25000, -18000, -24000, 0), 4, 4, TRUE)
mat <- ai(mat)
mat; solver(mat)
# This matrix holds all of the information needed to correctly solve this problem

# And there you have it! We can now quickly solve maximization problems with constraints
# of the form <=