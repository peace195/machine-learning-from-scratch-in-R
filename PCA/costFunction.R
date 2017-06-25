h_x <- function(X, theta1, theta2, theta3) {
  l2  <- rbind(1, sigmoid(theta1 %*% X))
  l3  <- rbind(1, sigmoid(theta2 %*% l2))
  return(sigmoid(theta3 %*% l3))
}

costFunction <- function(X, Y, theta1, theta2, theta3, lambda) {
  J <- -1/(dim(X)[2]) * sum(Y * log(h_x(X, theta1, theta2, theta3)) + (1 - Y) * log(1 - h_x(X, theta1, theta2, theta3))) + lambda/(2 * dim(X)[2]) * (sum(theta1[,2:NUMBER_THETA_COL1]^2) + sum(theta2[, 2:NUMBER_THETA_COL2]^2) + sum(theta3[, 2:NUMBER_THETA_COL3]^2))
  return(J)
}