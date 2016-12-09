source("https://raw.githubusercontent.com/SARussell-CO/MinorProjects/master/Simplex%20method.R")

# Unresolved issues ----
# Section 5-5 problem 45
# I am not getting the solution that the text provides, not sure why
mat <- matrix(c(1, 1, 0, 0, 1000,
                0, 0, 1, 1, 2000,
                1, 0, 1, 0, 1200,
                0, 1, 0, 1, 1600,
                250, 350, 290, 320, 0), 5, 5, TRUE)
solver(mat, minimize = FALSE)

# Resolved issues ----
# Create the matrix of constraints and then modify it
# Section 5-4 Problem 43 B
mat <- matrix(c(.5, .5, 1, 30,
                60000, 60000, 80000, 3200000,
                4000, 3000, 4000, 180000,
                -17000, -18000, -24000, 0), 4, 4, TRUE)
solver(mat)

# Let's look at the original matrix and the solved matrix and compare them:
rbind(add_identity(mat), rep(NA_real_, ncol(mat)), solver(mat)$Matrix)

# There are times when there is no solution to the system. The solver will note this
# with a warning.
# Section 5-4 Problem 31
mat <- matrix(c(-2, 1, 4,
                0, 1, 10,
                -2, -3, 0), 3, 3, TRUE)
solver(mat)

# There are times when we might be able to find multiple different solutions to the system.
# The functions will not resolve this issue but will warn that it happened. Different
# solutions can be investigated using the choice argument in the solver function.
# Section 5-4 problem 33
# In this case the solutions are the same
mat <- matrix(c(2, 1, 16,
                1, 0, 6,
                0, 1, 10,
                -1, -1, 0), 4, 3, TRUE)
solver(mat)
solver(mat, choice = 2)

# Section 5-5 Problem 45
mat <- matrix(c(20, 10, 20, 300,
                10, 20, 20, 200,
                70, 75, 90, 0), 3, 4, TRUE)
solver(mat, minimize = FALSE) # The warning should not be coming up

# Section 5-4 problem 35
# In this case the solutions vary based on the choice argument
mat <- matrix(c(1, 1, 2, 20,
                2, 1, 4, 32,
                -3, -3, -2, 0), 3, 4, TRUE)
solver(mat)
solver(mat, choice = 2)

# Several problems correctly solved as of 12/8/2016 ----
# Section 5-4 Problem 13
mat <- matrix(c(2, 1, 10,
                1, 1, 7,
                1, 2, 12,
                -30, -40, 0), 4, 3, TRUE)
solver(mat)

# Section 5-4 Problem 15
mat <- matrix(c(-2, 1, 2,
                -1, 1, 5,
                0, 1, 6,
                -2, -3, 0), 4, 3, TRUE)
solver(mat)

# Section 5-4 Problem 17
mat <- matrix(c(-1, 1, 2,
                -1, 3, 12,
                1, -4, 4,
                1, -2, 0), 4, 3, TRUE)
solver(mat)

# Section 5-4 Problem 19
mat <- matrix(c(1, 1, -1, 10,
                2, 4, 3, 30,
                -5, -2, 1, 0), 3, 4, TRUE)
solver(mat)

# Section 5-4 Problem 21
mat <- matrix(c(1, 0, 1, 4,
                0, 1, 1, 3,
                -2, -3, -4, 0), 3, 4, TRUE)
solver(mat)

# Section 5-4 Problem 23
mat <- matrix(c(3, 2, 5, 23,
                2, 1, 1, 8,
                1, 1, 2, 7,
                -4, -3, -2, 0), 4, 4, TRUE)
solver(mat)

# Section 5-4 Problem 25
mat <- matrix(c(.6, 1.2, 960,
                .03, .04, 36,
                .3, .2, 270,
                -20, -30, 0), 4, 3, TRUE)
solver(mat)

# Section 5-4 Problem
mat <- matrix(c(2, 2, 8, 600,
                1, 3, 2, 600,
                3, 2, 1, 400,
                -1, -2, -3, 0), 4, 4, TRUE)
solver(mat)

# Section 5-4 Problem 31
mat <- matrix(c(-2, 1, 4,
                0, 1, 10,
                -2, -3, 0), 3, 3, TRUE)
solver(mat)

# Section 5-4 Problem 33
mat <- matrix(c(2, 1, 16,
                1, 0, 6,
                0, 1, 10,
                -1, -1, 0), 4, 3, TRUE)
solver(mat)
solver(mat, choice = 2)

# Section 5-4 Problem 35
# There are different solutions based on the choice of column to use as the pivot column
mat <- matrix(c(1, 1, 2, 20,
                2, 1, 4, 32,
                -3, -3, -2, 0), 3, 4, TRUE)
solver(mat)
solver(mat, choice = 2)

# Section 5-4 Problem
mat <- matrix(c())
solver(mat)

# Section 5-4 Problem
mat <- matrix(c())
solver(mat)

# Section 5-4 Problem
mat <- matrix(c())
solver(mat)

# Section 5-4 Problem
mat <- matrix(c())
solver(mat)

