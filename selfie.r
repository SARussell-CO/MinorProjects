# Thu Oct 06 20:14:59 2016 ------------------------------
circ <- function(r, x, xcenter = 0, ycenter = 0, half = "top"){
	if (any((abs(x) - abs(xcenter)) > r)) print("There is an error with the x - values that you are entering. The circle extends from the center point at (xcenter, ycenter) out to r. If we choose an x value that is greater than our xcenter plus or minus our radius then we are choosing a point that does not exist in the circle.")
	if (half == "top") return(ycenter + (r^2 - (x - xcenter)^2)^0.5)
	if (half == "bottom") return(ycenter - (r^2 - (x - xcenter)^2)^0.5)
}

# The base circle, radius = pi, center at (5, 0)
plot(-1000, -1000, xlim = c(0, 2*pi), ylim = c(-pi, pi), yaxt = "n", xaxt = "n", ylab = "", xlab = "")
sp <- c(0, pi - pi * sqrt(2)/2, pi, pi + pi*sqrt(2)/2, pi + pi)
for (i in 1:4){
	xcoords <- c(seq(sp[i], sp[i + 1], 0.01), sp[i + 1])
	ytop <- circ(r = pi, x = xcoords, xcenter = pi)
	ybot <- circ(r = pi, x = xcoords, xcenter = pi, half = "bottom")
	lines(xcoords, ytop, col = c("red", "blue", "green4", "tomato3")[i])
	lines(xcoords, ybot, col = c("red", "blue", "green4", "tomato3")[i])
}

# The eyes
xcenter <- c(pi * 2/3, pi*4/3)
r <- pi/5
for (i in 1:2){
	xc <- xcenter[i]
	lb <- xc - r
	rb <- xc + r
	xcoords <- c(seq(lb, rb, 0.01), rb)
	ytop <- circ(r = pi / 5, x = xcoords, xcenter = xc, ycenter = 1.5)
	ybot <- circ(r = pi / 5, x = xcoords, xcenter = xc, ycenter = 1.5, half = "bottom")
	lines(xcoords, ytop, col = "green4")
	lines(xcoords, ybot, col = "green4")
}

# Create the nose
polygon(x = c(pi - .5, pi + .3, pi), y = c(0, 2/3, 0), col = "blue")

# Create a full circle for the mouth
xcenter <- pi
r <- pi/5
xcoords <- c(seq(xcenter - r, xcenter + r, 0.01), xcenter + r)
ytop <- circ(r = r, x = xcoords, xcenter = xcenter, ycenter = -1)
ybot <- circ(r = r, x = xcoords, xcenter = xcenter, ycenter = -1, half = "bottom")
polygon(x = c(xcoords, rev(xcoords)), y = c(ytop, ybot), col = "blue")

# Plot an arbitrary amount of circles!---------
n <- 8
radii <- sample(1:4, n, TRUE)
xc <- sample(sample(-2:2), n, TRUE)
yc <- sample(sample(-2:2), n, TRUE)
cols <- sample(colors(), n, FALSE)
plot(-1000, 1000, xlim = c(-6, 6), ylim = c(-6, 6))
for (i in 1:n){
	xcoords <- c(seq(xc[i] - radii[i], xc[i] + radii[i], 0.01), xc[i] + radii[i])
	ytop <- circ(r = radii[i], x = xcoords, xcenter = xc[i], ycenter = yc[i], half = "top")
	ybottom <- circ(r = radii[i], x = xcoords, xcenter = xc[i], ycenter = yc[i], half = "bottom")
	lines(xcoords, ytop, col = cols[i])
	lines(xcoords, ybottom, col = cols[i])
}