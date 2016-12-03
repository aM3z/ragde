# ragde
This is an abstract algebra project involving various cryptosystems such as shift ciphers, affine ciphers, and RSA.

## .clue file format

+ Line 1: a
+ Line 2: b
+ Line 3: ciphertext

*Note:* 
Line 1 and line 2 must contain valid R expressions. For example, if a=2 and b=5 then line 1 and line 2 must contain integers 2 and 5, respectively.
If line 1 represents a square matrix then line 1 should contain a numerical vector c(1,2,3,4,..,m) of length equal to a square number and containing the by-column entries of the matrix.
If line 2 represents a vector then it should contain a numerical vector c(1,2,...,n) with length equal to the square root of the length of the numerical vector in line 1.

