#' Encrypts an affine cryptosystem.
#' 
#' @param data list object with a, b, and cyphertext entries
#' @return character cyphertext string
#' @examples
#' decode_affine(data)

encrypt_affine<-function(data) {

	# get a, b, and cleartext from data	
	a<-data[["a"]]
	b<-data[["b"]]
	cleartext<-data[["cleartext"]]

	# stop("a does not have an inverse")

	# this vector will be used to convert chars to digits
	chars_to_digits<-0:25
	names(chars_to_digits)<-LETTERS

	# this vector will be used to convert digits to chars
	digits_to_chars<-LETTERS
	names(digits_to_chars)<-0:25

	# define mod
	mod<-length(chars_to_digits)
	
	# does a have an inverse
	mul_inv(a, mod)
	 
	# convert cleartext to a character vector
	clear_chars<-substring(cleartext, seq(1, nchar(cleartext), 1), seq(1, nchar(cleartext), 1))

	# convert character vector to numerical vector
	clear_digits<-chars_to_digits[clear_chars]

	# use encoding function
	cypher_digits<-add_mod_n(mul_mod_n(a, clear_digits, mod), b, mod)

	# convert clear digits to chars
	cypher_chars<-digits_to_chars[as.character(cypher_digits)]

	# paste chars into a string
	cyphertext<-paste(cypher_chars, collapse="")

	return(cyphertext)
}
