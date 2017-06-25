#The input can be a number or a matrix,...
#Example: A <- matrix(c(1:4), 2, 2); sigmoid(A)

sigmoid <- function(x) {
  return(1/(1 + exp(-x)))
}