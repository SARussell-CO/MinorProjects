# rm(list = ls())
# source("https://raw.githubusercontent.com/SARussell-CO/MinorProjects/master/Simplex%20method.R")
# source("C://Users/spensa/Desktop/GitHub/MinorProjects/Simplex method.R")

# Unresolved issues ----
# Section 5-5 problem 45
# I am not getting the solution that the text provides, not sure why
mat <- matrix(c(1, 1, 0, 0, 1000,
                0, 0, 1, 1, 2000,
                1, 0, 1, 0, 1200,
                0, 1, 0, 1, 1600,
                250, 350, 290, 320, 0), 5, 5, TRUE)
solver(mat, minimize = FALSE)

# Initial testing (resolved issues) ----
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

# Section 5-4 exercises ----
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

# Section 5-4 Problem 37
mat <- matrix(c(2, 3, 2, 1000,
                1, 1, 2, 800,
                -7, -8, -10, 0), 3, 4, TRUE)
solver(mat)

# Section 5-4 Problem 39
mat <- matrix(c(1, 1, 1, 100000,
                0, 1, 1, 50000,
                -.08, -.13, -.15, 0), 3, 4, TRUE)
solver(mat)

# Section 5-4 Problem 41
mat <- matrix(c(1000, 2000, 1500, 20000,
                1, 1, 1, 15,
                -14000, -24000, -18000, 0), 3, 4, TRUE)
solver(mat)

# Section 5-4 Problem 43 A
mat <- matrix(c(.5, .5, 1, 30,
                60000, 60000, 80000, 3200000,
                4000, 3000, 4000, 180000,
                -20000, -18000, -24000, 0), 4, 4, TRUE)
solver(mat)

# Section 5-4 Problem 43 B
mat <- matrix(c(.5, .5, 1, 30,
                60000, 60000, 80000, 3200000,
                4000, 3000, 4000, 180000,
                -17000, -18000, -24000, 0), 4, 4, TRUE)
solver(mat)

# Section 5-4 Problem 43 C
mat <- matrix(c(.5, .5, 1, 30,
                60000, 60000, 80000, 3200000,
                4000, 3000, 4000, 180000,
                -25000, -18000, -24000, 0), 4, 4, TRUE)
solver(mat)

# Section 5-4 Problem 45 A
mat <- matrix(c(4, 12, 8, 4800,
                4, 4, 8, 4000,
                12, 4, 8, 5600,
                -4, -3, -5, 0), 4, 4, TRUE)
solver(mat)

# Section 5-4 Problem 45 B
mat <- matrix(c(4, 12, 8, 4800,
                4, 4, 8, 5000,
                12, 4, 8, 5600,
                -4, -3, -5, 0), 4, 4, TRUE)
solver(mat)

# Section 5-4 Problem 45 C
mat <- matrix(c(4, 12, 8, 6000,
                4, 4, 8, 6000,
                12, 4, 8, 5600,
                -4, -3, -5, 0), 4, 4, TRUE)
solver(mat)

# Section 5-4 Problem 47
mat <- matrix(c(1, 3, 2, 30,
                2, 1, 2, 24,
                -3, -4, -5, 0), 3, 4, TRUE)
solver(mat)

# Section 5-4 Problem 49
mat <- matrix(c(100, 150, 200, 3200,
                1, 1, 1, 20,
                -18, -25, -30, 0), 3, 4, TRUE)
solver(mat)

# Section 5-5 Exercises ----
# Working with these exercises requires some slighl changes to the inputted matrix.
# First, no negative values in the bottom row if we are specifying maximize = FALSE,
# which we are mostly doing in this section. Second, there must be more care in reading
# the output as the solution matrix has answers to the minimization problem as well
# as a corresponding solution to the dual maximization problem. You have been warned.
# Section 5-5 Problem 11 A
mat <- matrix(c(2, 3, 21,
                5, 7, 50,
                -12, -17, 0), 3, 3, TRUE)
solver(mat)

# Section 5-5 Problem 11 B
mat <- matrix(c(2, 5, 12,
                3, 7, 17,
                21, 50, 0), 3, 3, TRUE)
solver(mat, maximize = FALSE)

# Section 5-5 Problem 13
mat <- matrix(c(4, 1, 13,
                3, 1, 12,
                9, 2, 0), 3, 3, TRUE)
solver(mat, maximize = FALSE)

# Section 5-5 Problem 15
mat <- matrix(c(2, 3, 15,
                1, 2, 8,
                7, 12, 0), 3, 3, TRUE)
solver(mat, maximize = FALSE)

# Section 5-5 Problem 17
mat <- matrix(c(2, 1, 8,
                -2, 3, 4,
                11, 4, 0), 3, 3, TRUE)
solver(mat, maximize = FALSE)

# Section 5-5 Problem 19
mat <- matrix(c(-3, 2, 6,
                1, -2, 4,
                7, 9, 0), 3, 3, TRUE)
solver(mat, maximize = FALSE)

# Section 5-5 Problem 21
mat <- matrix(c(2, 1, 8,
                1, 2, 8,
                3, 9, 0), 3, 3, TRUE)
solver(mat, maximize = FALSE)
sol1 <- solver(mat, maximize = FALSE)
sol2 <- solver(mat, choice = 2, maximize = FALSE)
identical(sol1, sol2)
# I think that for this problem we must go into a manual procedure and see where in the
# process we are able to choose the pivot column.
mat <- matrix(c(2, 1, 8,
                1, 2, 8,
                3, 9, 0), 3, 3, TRUE)
mat <- add_identity(t(mat))
library(magrittr)
mat[nrow(mat), c(1,2)] <- mat[nrow(mat), c(1,2)] * -1
mat
# Sweet! Now it is easy to see that the choice comes at the beginning and can be easily
# solved correctly by the created functions.
mat %>% changer %>% changer 

# Section 5-5 Problem 23
mat <- matrix(c(1, 1, 4,
                1, -2, -8,
                -2, 1, -8,
                7, 5, 0), 4, 3, TRUE)
solver(mat, maximize = FALSE)

# Section 5-5 Problem 25
mat <- matrix(c(2, 1, 16,
                1, 1, 12,
                1, 2, 14,
                10, 30, 0), 4, 3, TRUE)
solver(mat, maximize = FALSE)

# Section 5-5 Problem 27
mat <- matrix(c(1, 0, 4,
                1, 1, 8,
                1, 2, 10,
                5, 7, 0), 4, 3, TRUE)
solver(mat, maximize = FALSE)

# Section 5-5 Problem 29
mat <- matrix(c(1, 1, 2, 7,
                2, 1, 1, 4,
                10, 7, 12, 0), 3, 4, TRUE)
solver(mat, maximize = FALSE)

# Section 5-5 Problem 31
mat <- matrix(c(1, -4, 1, 6,
                -1, 1, -2, 4,
                5, 2, 2, 0), 3, 4, TRUE)
solver(mat, maximize = FALSE)

# Section 5-5 Problem 41
mat <- matrix(c(3, 2, 2, 16,
                4, 3, 1, 14,
                5, 3, 1, 12,
                16, 8, 4, 0), 4, 4, TRUE)
solver(mat, maximize = FALSE)

# Section 5-5 Problem 43
mat <- matrix(c(1, 1, 0, 0, 12,
                0, 0, 1, 1, 25,
                1, 0, 1, 0, 20,
                0, 1, 0, 1, 15,
                5, 4, 5, 6, 0), 5, 5, TRUE)
solver(mat, maximize = FALSE)
# The solver has come up with a different answer, manually check (or view matrices in a stack)
stack <- solver(mat, maximize = FALSE, stack = TRUE)$Stack
View(stack)
# I solved this manually and compared with the stacked matrices. I think the book made
# a mistake.

# Section 5-5 Problem 45 A
mat <- matrix(c(20, 10, 20, 300,
                10, 20, 20, 200,
                70, 75, 90, 0), 3, 4, TRUE)
solver(mat, maximize = FALSE)

# Section 5-5 Problem 45 B
mat <- matrix(c(20, 10, 20, 300,
                10, 20, 20, 300,
                70, 75, 90, 0), 3, 4, TRUE)
solver(mat, maximize = FALSE)
solver(mat, maximize = FALSE, choice = 2) # Both have the same results

# Section 5-5 Problem 45 C
mat <- matrix(c(20, 10, 20, 300,
                10, 20, 20, 400,
                70, 75, 90, 0), 3, 4, TRUE)
solver(mat, maximize = FALSE)

# Section 5-5 Problem 47
mat <- matrix(c(-1, 0, -1, 0, -1000,
                0, -1, 0, -1, -2000,
                1, 1, 0, 0, 1200,
                0, 0, 1, 1, 1600,
                250, 290, 350, 320, 0), 5, 5, TRUE)
solver(mat, maximize = FALSE)

# Section 5-5 Problem 49
mat <- matrix(c(20, 10, 10, 300,
                10, 10, 10, 200,
                10, 15, 10, 240,
                20, 24, 18, 0), 4, 4, TRUE)
solver(mat, maximize = FALSE)

# Section 5-5 Problem 51
mat <- matrix(c(1, 1, 0, 0, 300,
                0, 0, 1, 1, 500,
                -1, 0, -1, 0, -400,
                0, -1, 0, -1, -500,
                5, 2, 3, 4, 0), 5, 5, TRUE)
solver(mat, maximize = FALSE)

