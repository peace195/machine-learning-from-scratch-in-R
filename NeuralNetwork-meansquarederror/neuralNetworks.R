#Init data
source("showImage.R")
source("init.R")
source("sigmoid.R")
source("costFunction.R")
source("predict.R")

costFunction(train, train_label, theta1, theta2, lambda)
#source("gradientConvex.R")

while(1) {
  l2_tmp <- sigmoid(theta1 %*% X)
  l2  <- rbind(1, l2_tmp)
  hypo <- sigmoid(theta2 %*% l2)
  
  J <- 1/(2*dim(X)[2]) * (sum((hypo - Y)^2) + lambda * (sum(theta1[,2:NUMBER_THETA_COL1 ]^2) + sum(theta2[, 2:NUMBER_THETA_COL2]^2)))
  
  error_l3 <- (hypo - Y)*hypo*(1-hypo)
  delta_theta2 <- error_l3 %*% t(l2)
  
  #OK
  error_l2 <- l2_tmp*(1-l2_tmp)*(t(theta2[,2:NUMBER_THETA_COL2 ]) %*% error_l3)
  delta_theta1 <- error_l2 %*% t(X)
  
  delta_theta1 <- alpha/dim(train)[2] * delta_theta1 + cbind(0, theta1[, 2:NUMBER_THETA_COL1]) * (alpha*lambda/dim(train)[2])
  delta_theta2 <- alpha/dim(train)[2] * delta_theta2 + cbind(0, theta2[, 2:NUMBER_THETA_COL2]) * (alpha*lambda/dim(train)[2])
  
  theta1 <- theta1 - delta_theta1
  theta2 <- theta2 - delta_theta2
  
  print(J)

}


Y_test <- predict(test, theta1, theta2)

ret <- matrix(0, dim(test)[2], 2)
for (i in 1:dim(Y_test)[2]) {
  for (j in 1:dim(Y_test)[1]) {
    if (Y_test[j, i] == 1) {
      if (j != 10) {
        ret[i, ] <- c(i, j)
      } else {
        ret[i, ] <- c(i, 0)
      }
    }
  }
}
View(ret)

colnames(ret) <- c("ImageId", "Label")
write.csv(ret, "submission.csv", row.names = FALSE)