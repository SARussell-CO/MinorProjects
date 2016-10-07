rm(list = ls())


# Thu Oct 06 20:14:59 2016 ------------------------------
circ <- function(r, x, xcenter = 0, ycenter = 0){
	if (any((abs(x) - abs(xcenter)) > r)) print("There is an error with the x - values that you are entering. The circle extends from the center point at (xcenter, ycenter) out to r. If we choose an x value that is greater than our xcenter plus or minus our radius then we are choosing a point that does not exist in the circle.")
	y <- ycenter + (r^2 - (x - xcenter)^2)^0.5
}

# The base circle, radius = pi, center at (5, 0)
plot(-1000, -1000, xlim = c(0, 2*pi), ylim = c(-pi, pi), yaxt = "n", xaxt = "n", ylab = "", xlab = "")
sp <- c(0, pi - pi * sqrt(2)/2, pi, pi + pi*sqrt(2)/2, pi + pi)
for (j in c(1,-1)){
	for (i in 1:4){
		xcoords <- c(seq(sp[i], sp[i + 1], 0.01), sp[i + 1])
		y <- j * circ(r = pi, x = xcoords, xcenter = pi)
		lines(xcoords, y, col = c("red", "blue", "green4", "tomato3")[i])
	}
}

# The eyes
xcenter <- c(pi * 2/3, pi*4/3)
r <- pi/5
for (i in 1:2){
	xc <- xcenter[i]
	lb <- xc - r
	rb <- xc + r
	xcoords <- c(seq(lb, rb, 0.01), rb)
	for (j in c(1,-1)){
		y <- j * circ(r = pi / 5, x = xcoords, xcenter = xc) + 1.5
		lines(xcoords, y, col = "green4")
	}
}

# Create the nose
polygon(x = c(pi - .5, pi + .3, pi), y = c(0, 2/3, 0), col = "blue")

# Create a full circle for the mouth
xcenter <- pi
r <- pi/5
lb <- xcenter - r
rb <- xcenter + r
xcoords <- c(seq(lb, rb, 0.01), rb)
ytop <- circ(r = r, x = xcoords, xcenter = xcenter) - 1
ybot <- -1 * circ(r = r, x = xcoords, xcenter = xcenter) - 1
polygon(x = c(xcoords, rev(xcoords)), y = c(ytop, ybot), col = "blue")

# I want to set this up so that I can create an arbitrary amount of circles with specific coordinates,
# radius and then be able to loop through the list and plot all the cirles. Sounds like fun!
# 
# I added this to test the RStudio integration with Git and GitHub