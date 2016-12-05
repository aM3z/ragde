#' This function returns the modular inverse of 2-by-2 matrix ().
#'
#' @param A a 2-by-2 matrix
#' @param n an integer
#' @return modular inverse of matrix A
#' @export
#' @examples
#' matrix_mul_inv(A, 26)

matrix_mul_inv<-function(A, n) {
	# find the cofactor matrix transpose
	cmt = matrix(c(A[2,2], -A[2,1], -A[1,2], A[1,1]), ncol=2)
	# compute the determinant
	det = (cmt[1,1] * cmt[2,2]) - (cmt[2,1] * cmt[1,2])
	det = det %% n
	# find the multiplicative inverse of the determinant
	inv_det = mul_inv(det, n)
	# scaled the cmt matrix by the inverse of the determinant
	scaled_matrix = inv_det * cmt
	# mod n of entries	
	return(scaled_matrix %% n)

}
