#' This function returns the inverse of x under addition mod n.
#'
#' @param x an integer
#' @param n an integer
#' @return x-inverse under addition mod n
#' @examples 
#' add_inv(2, 10)

add_inv<-function(x, n) {
	for(i in 1:n) {
		sum <- i + x
		if(sum %% n == 0) {
			return(i)
		}
	}
}
