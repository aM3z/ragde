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

	# this vector will be used to convert chars to digits
	chars_to_digits<-0:25
	names(chars_to_digits)<-LETTERS

	# this vector will be used to convert digits to chars
	digits_to_chars<-LETTERS
	names(digits_to_chars)<-0:25

	# define mod
	mod<-length(chars_to_digits)

	# convert cleartext to a character vector
	clear_chars<-substring(cleartext, seq(1, nchar(cleartext), 1), seq(1, nchar(cleartext), 1))

	# convert character vector to numerical vector
	clear_digits<-chars_to_digits[clear_chars]

	# compute inverses for a and b
	#a_inverse<-mul_inv(a, mod)
	#b_inverse<-add_inv(b, mod)

	# use encoding function
	cypher_digits<-add_mod_n(mul_mod_n(a, clear_digits, mod), b, mod)

	# convert clear digits to chars
	cypher_chars<-digits_to_chars[as.character(cypher_digits)]

	print(cypher_chars)
	#cypher_words<-c()

	#for(i in seq(1, length(cypher_chars), 5)) {
		#if((i - 1) %% 5 == 0) {
			
	#		new_word<-paste(cypher_chars[i:(i+4)], collapse="")
	#		print(new_word)
	#		cypher_words<-c(cypher_words, new_word)
		#}
	#}

	#print(cypher_words)

	# paste chars into a string
	cyphertext<-paste(cypher_chars, collapse="")

	return(cyphertext)
}
