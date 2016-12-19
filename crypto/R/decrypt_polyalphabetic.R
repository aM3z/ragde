#' Decrypts an polyalphabetic cryptosystem.
#' 
#' @param data list object with A, b, and cyphertext entries
#' @return character cleartext string
#' @export
#' @examples
#' decrypt_polyalphabetic(data=list(A=matrix(c(3,1,5,2), ncol=2), b=c(2,2),cyphertext="RRGR"))

decrypt_polyalphabetic<-function(data) {

	# get a, b, and cyphetext from data	
	A<-data[["A"]]
	b<-data[["b"]]
	cyphertext<-data[["ciphertext"]]

	# this vector will be used to convert chars to digits
	chars_to_digits<-0:25
	names(chars_to_digits)<-LETTERS

	# this vector will be used to convert digits to chars
	digits_to_chars<-LETTERS
	names(digits_to_chars)<-0:25

	# define mod
	mod<-length(chars_to_digits)

	# convert cyphertext to a character vector
	cypher_chars<-substring(cyphertext, seq(1, nchar(cyphertext), 1), seq(1, nchar(cyphertext), 1))

	# convert character vector to numerical vector
	cypher_digits<-chars_to_digits[cypher_chars]

	# compute inverses for a and b
	A_inverse<-matrix_mul_inv(A, mod)
	b_inverse<-vector_add_inv(b, mod)

	clear_digits = c()
	# use decoding function
	for(i in seq(1, length(cypher_digits), 2)) {
		p = cypher_digits[i:(i + 1)]
		c = (A_inverse %*% (p + b_inverse)) %% mod
		clear_digits = c(clear_digits, c)
	}

	# convert clear digits to chars
	clear_char<-digits_to_chars[as.character(clear_digits)]

	# paste chars into a string
	cleartext<-paste(clear_char, collapse="")

	return(cleartext)
}
