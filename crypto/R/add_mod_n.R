#' This function performs addition mod n
#' 
#' @param a an integer
#' @param b an integer
#' @param n an integer
#' @return a + b mod n
#' @export
#' @examples
#' add_mod_n(2,16,10)

add_mod_n<-function(a, b, n) {
	sum<- (a + b) %% n
	return(sum)
}
