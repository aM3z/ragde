#' This function returns the inverse of x under multiplication mod n.
#' Recall that x and n must be relatively prime.
#'
#' @param x an integer
#' @param n an integer
#' @return x-inverse under multiplication mod n
#' @examples 
#' mul_inv(3, 10)

mul_inv<-function(x, n) {
	for(i in 1:n) {
		mul<- i * x
		if(mul %% n == 1) {
			return(i)
		}
	}

	stop(paste(x, " does not have an inverse under multiplication mod ", n)) 
}
