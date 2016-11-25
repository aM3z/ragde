#' This function performs multiplication mod n
#' 
#' @param a an integer
#' @param b an integer
#' @param n an integer
#' @return a * b mod n
#' @examples
#' mul_mod_n(3,16,10)

mul_mod_n<-function(a, b, n) {
	product<- (a * b) %% n
	return(product)
}
