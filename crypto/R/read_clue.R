#' Reads a .clue formated file.
#'
#' @param filepath string containing relative path to .clue file
#' @return list containing data from the file
#' @examples
#' read_clue("../clues/filename.clue")

read_clue<-function(filepath) {
	# read file line-by-line
	line<-readLines(filepath)
	# split first line
	#first_line_split<-unlist(strsplit(line[1], ";"))
	# eval first line
	#if(length(first_line_split) == 1) {
	#	a<-eval(parse(text=line[1]))	
	#} else if (length(first_line_split) == 2) {
	#	entries<-eval(parse(text=first_line_split[1]))
	#	dim<-eval(parse(text=first_line_split[2]))
	#	a<-matrix(entries, ncol=dim)
	#} else {
	#	stop("line 1 is not formatted properly")
	#}

	a<-eval(parse(text=line[1]))
	if(length(a) > 1) {
		dim<-sqrt(length(a))
		a<-matrix(a, dim)
	}
	
	# eval second line
	b<-eval(parse(text=line[2]))
	if(length(b) > 1 && length(b) != dim(a)[2]) stop ("b must have length equal to number of columns in the a matrix")
	
	# remove all white spaces from third line
	c_text<-gsub("[[:blank:]]", "", line[3])

	if(is.numeric(a) == F || is.numeric(b) == F) stop("a and b must be numeric")

	# consolidate into data vector
	data<-list(a=a, b=b, c_text=c_text)

	return(data)
}
