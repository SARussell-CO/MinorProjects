# The encoding matrix
encodingMatrix <- matrix(c(1, 0, 1, 0, 1,
													 0, 1, 1, 0, 3,
													 2, 1, 1, 1, 1,
													 0, 0, 1, 0, 2,
													 1, 1, 1, 2, 1), 5, 5, TRUE)

# The message to convert
message <- "The Best Years of Our Lives"

# Functions used for encoding the message follow-----
# Convert letters into numbers
converter <- function(message){
	message <- tolower(message)
	msg2 <- strsplit(message, "")
	l <- vector("list", nchar(message))
	for (i in 1:nchar(message)){
		l[i] <- msg2[[1]][i]
	}
	l <- sapply(l, function(x) which(letters == x))
	l <- ifelse(l %in% 1:26, l, 0)
	vals <- unlist(l)
	vals
}

# Put in matrix form
adjuster <- function(message, encodingMatrix, encode = TRUE){
	eM <- encodingMatrix
	if (encode == TRUE) ({
		vals <- converter(message)
		rows <- ncol(eM)
		cols <- ceiling(length(vals) / rows)
		add0 <- rows * cols - length(vals)
		vals <- c(vals, rep(0, add0))
		mat <- matrix(vals, rows, cols)
	})
	if (encode == FALSE) ({
		if (is.null(dim(message)) == FALSE) stop("Accepts vectors only")
		rows <- ncol(eM)
		cols <- ceiling(length(message) / rows)
		add0 <- rows * cols - length(message)
		message <- c(message, rep(0, add0))
		mat <- matrix(message, rows, cols)
	})
	mat
}

# Encode the message
encoder <- function(message, encodingMatrix){
	vals <- converter(message)
	eM <- encodingMatrix
	mat <- adjuster(message, eM)
	encodedMessage <- eM %*% mat
	encodedMessage
}

# Test
encoder(message, encodingMatrix)

# This is for decoding messages that have been encoded using a matrix
decoder <- function(codedMessage, encodingMatrix){
	# For this to work we must have the matrix that was first used to encode the message
	cM <- codedMessage; eM <- encodingMatrix
	mat <- adjuster(cM, eM, FALSE)
	decodedMatrix <- round(solve(eM) %*% mat, 8)
	vec <- as.vector(decodedMatrix)
	l <- sapply(vec[1:length(vec)], function(x)(letters[x]))
	l <- ifelse(l %in% letters, l, " ")
	require(stringr)
	str_trim(str_c(unlist(l), collapse = ""))
}

# Test
codedMessage <- c(32, 34, 60, 19, 40, 24, 21, 67, 11, 69,
									27, 44, 85, 16, 85, 29, 65, 82, 28, 82,
									21, 66, 44, 41, 62, 8, 0, 16, 0, 8)
decoder(codedMessage, encodingMatrix)
d <- decoder(c(28, 22, 56, 11, 36, 30, 27, 75, 15, 78,
							 30, 51, 64, 30, 62, 39, 30, 58, 25, 44), encodingMatrix)
length(d) == length(unique(d)) # There are no repeated values
d
