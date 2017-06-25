predict <- function(X_test, Theta) {
  Y_test <- exp(t(theta)%*%X_test)
  tmp <- colSums(Y_test);
  tmp <- matrix(tmp, dim(Y_test)[2], dim(Y_test)[1])
  tmp <- t(tmp)
  Y_test <- 1/tmp * Y_test
  tmp <- apply(Y_test,2, max, na.rm = TRUE)
  tmp <- matrix(tmp, dim(Y_test)[2], dim(Y_test)[1])
  tmp <- t(tmp)
  Y_test <- Y_test == tmp
  Y_test[,1:dim(Y_test)[2]] <- as.numeric(Y_test[,1:dim(Y_test)[2]])
  return(Y_test)
}