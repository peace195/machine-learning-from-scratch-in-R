h_x <- function(X, theta1, theta2) {
  l2  <- rbind(1, sigmoid(theta1 %*% X))
  return(sigmoid(theta2 %*% l2))
}

costFunction <- function(X, Y, theta1, theta2, lambda) {
  J <- 1/(2*dim(X)[2]) * (sum((h_x(X, theta1, theta2) - Y)^2) + lambda * (sum(theta1[,2:NUMBER_THETA_COL1 ]^2) + sum(theta2[, 2:NUMBER_THETA_COL2]^2)))
  return(J)
}