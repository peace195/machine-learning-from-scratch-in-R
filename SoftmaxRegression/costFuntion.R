h_x <- function (X, Theta) {
  Y <- exp(t(theta)%*%X)
  tmp <- colSums(Y);
  tmp <- matrix(tmp, dim(Y)[2], dim(Y)[1])
  tmp <- t(tmp)
  Y <- 1/tmp * Y
# y <- y == max(y)
# y[,1:dim(y)[2]] <- as.numeric(y[,1:dim(y)[2]])
  return(Y)
}

#X: 42000 x 785, Y: 10 x 42000, theta: 785 x 10
costFunction <- function (X, Y, Theta) {
  probs = h_x(t(X), Theta)
  J <- -1/dim(X)[1] * sum(Y*log(probs))
  return(J)
}