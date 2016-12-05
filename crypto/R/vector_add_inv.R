#' This function returns the inverse of vector x  under addition mod n.
#'
#' @param x a vector of length 2 
#' @param n an integer
#' @return x-inverse under addition mod n
#' @export
#' @examples 
#' vector_add_inv(c(2,2), 10)

vector_add_inv<-function(x, n) {
	inv = c(add_inv(x[1], n), add_inv(x[2], n))
	return(inv)
}
