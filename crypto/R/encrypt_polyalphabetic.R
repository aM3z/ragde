#' Encrypts a polyalphabetic cryptosystem.
#' 
#' @param data list object with A, b, and cleartext entries
#' @return character cyphertext string
#' @export
#' @examples
#' encrypt_polyalphabetic(data=list(A=matrix(c(3,1,5,2), ncol=2), b=c(2,2),cleartext="HELP"))

encrypt_polyalphabetic<-function(data) {

	# get a, b, and cleartext from data	
	A<-data[["A"]]
	b<-data[["b"]]
	cleartext<-data[["cleartext"]]

	# this vector will be used to convert chars to digits
	chars_to_digits<-0:25
	names(chars_to_digits)<-LETTERS

	# this vector will be used to convert digits to chars
	digits_to_chars<-LETTERS
	names(digits_to_chars)<-0:25

	# define mod
	mod<-length(chars_to_digits)
	
	# does a have an inverse
	matrix_mul_inv(A, mod)
	 
	# convert cleartext to a character vector
	clear_chars<-substring(cleartext, seq(1, nchar(cleartext), 1), seq(1, nchar(cleartext), 1))

	# convert character vector to numerical vector
	clear_digits<-chars_to_digits[clear_chars]

	# use encoding function
	cypher_digits = c()

	for(i in seq(1, length(clear_digits), 2)) {
		p = clear_digits[i:(i + 1)]
		c = (A %*% p + b) %% mod
		cypher_digits = c(cypher_digits, c)
	}


	# convert clear digits to chars
	cypher_chars<-digits_to_chars[as.character(cypher_digits)]

	# paste chars into a string
	cyphertext<-paste(cypher_chars, collapse="")

	return(cyphertext)
}
