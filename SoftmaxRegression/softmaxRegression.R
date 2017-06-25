#Streaming
source("showImage.R")
source("init.R")

#Training theta
source("costFuntion.R")
source("gradientConvex.R")

costFunction(train, train_label, theta)

while(1) {
  theta <- theta - alpha * gradientConvex(train, train_label, theta)
  if (costFunction(train, train_label, theta) <= 0.3) {
    break
  }
}

#Predict and analysis
source("predict.R")
Y_test <- predict(t(test), theta)

ret <- matrix(0, dim(test)[1], 2)
for (i in 1:dim(Y_test)[2]) {
  for (j in 1:dim(Y_test)[1]) {
    if (Y_test[j, i] == 1) {
      if (j != 10) {
        ret[i, ] <- c(i, j)
      } else {
        ret[i, ] <- c(i, 0)
      }
      break
    }
  }
}
ret

colnames(ret) <- c("ImageId", "Label")
write.csv(ret, "submission.csv", row.names = FALSE)