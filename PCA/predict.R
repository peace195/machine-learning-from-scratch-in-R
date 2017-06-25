predict <- function(X_test, theta1, theta2, theta3) {
  Y_test <- h_x(X_test, theta1, theta2, theta3)
  tmp <- apply(Y_test,2, max, na.rm = TRUE)
  tmp <- matrix(tmp, dim(Y_test)[2], dim(Y_test)[1])
  tmp <- t(tmp)
  Y_test <- Y_test == tmp
  Y_test[,1:dim(Y_test)[2]] <- as.numeric(Y_test[,1:dim(Y_test)[2]])
  return(Y_test)
}
