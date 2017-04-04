# Created on
# Mon Mar 27 19:23:33 2017 ------------------------------
#----------------------------------------------------------------------------------------------------#
# Intro and notes ---------
#----------------------------------------------------------------------------------------------------#
# These functions are simple shortcuts for cleaning up the Global environment. There are times
# when I am going through a script and create several objects that clutter my environment.
# Here are some simple methods to quickly remove what I do not need so I can stay productive.

# Remove non-functions! ---------
#----------------------------------------------------------------------------------------------------#
# For when you really want to clean up your environment of all but the functions!
remove_non_functions <- function(){
  vec <- numeric(length(ls(envir = .GlobalEnv)))
  i <- 1
  for (i in 1:length(vec)){
    vec[i] <- is.function( get( ls(envir = .GlobalEnv)[i] ) )
  }
  vec <- as.logical(!vec)
  rm(list = ls(envir = .GlobalEnv)[vec], envir = .GlobalEnv)
}

# Remove all but what you specify ---------
#----------------------------------------------------------------------------------------------------#
# If you want to keep certain objects then here is a simple wrapper that will do just that
remove_all_but <- function(variables, keep_all_functions = FALSE) {
  # Whenever this is packaged feel free to remove this line and the next two
  variables <- c(variables, "remove_all_but", "remove_non_functions")
  
  if ( keep_all_functions == TRUE ){
    vec <- numeric(length(ls(envir = .GlobalEnv)))
    i <- 1
    for (i in 1:length(vec)){
      vec[i] <- is.function( get( ls(envir = .GlobalEnv)[i] ) )
    }
    variables <- c(variables, ls(envir = .GlobalEnv)[as.logical(vec)] )
  }
  
  if(!all(is.character(variables) ) ) {stop("Please pass in character type objects")}
  
  l <- vector("list", 3)
  names(l) <- c("current", "tokeep", "toremove")
  l$current  <- ls(envir = .GlobalEnv)
  l$tokeep   <- variables
  l$toremove <- ls(envir = .GlobalEnv)[-which(ls(envir = .GlobalEnv) %in% variables) ]
  l
  rm( list = l$toremove, envir = .GlobalEnv)
}
