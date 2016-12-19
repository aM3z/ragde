#' Decrypts an affine cryptosystem.
#' 
#' @param data list object with a, b, and cyphertext entries
#' @return character clear text string
#' @export
#' @examples
#' decrypt_affine(data=list(a=5,b=3,cyphertext="DGHXIKD"))

decrypt_affine<-function(data) {

	# get a, b, and cyphetext from data	
	a<-data[["a"]]
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
	a_inverse<-mul_inv(a, mod)
	b_inverse<-add_inv(b, mod)

	# use decoding function
	clear_digits<- (a_inverse * (cypher_digits + b_inverse)) %% mod

	# convert clear digits to chars
	clear_char<-digits_to_chars[as.character(clear_digits)]

	# paste chars into a string
	cleartext<-paste(clear_char, collapse="")

	return(cleartext)
}
