#The visualization for 9 first samples of training set
train <- read.csv("../train.csv")
test <- read.csv("../test.csv")

#because the hardware is very slow
#we split data into small piece
#train <- train[1:3000, ]
#test <- test[1:200, ]
train$label -> tmp_train_label
train <- train[, -1]


#Convert labels to the matrix form 10 x 42000
train_label <- matrix(c(1:9, 0), 10, dim(train))
for (i in 1:length(tmp_train_label)) {
  train_label[, i] <- as.numeric(train_label[, i] == tmp_train_label[i])
}

print("Dimension of trainning set")
print(dim(train))
print("Dimension of test set")
print(dim(test))

#png("./bt.png")
par(mfrow = c(3,3))
for (i in 1:9) {
  t(matrix(as.numeric(train[i, ]), nrow = 28, ncol = 28)) -> matrixOfPixel
  t(apply(matrixOfPixel , 2, rev)) -> matrixOfPixel
  image(z = matrixOfPixel, axes = FALSE, col = gray(0:255/255))
  
}

#dev.off()

bind <- rbind(train, test)

#The visualization of test set is the same as training set
#Pre-processing, PCA 
bind <- as.matrix(bind - matrix(rowSums(bind)/dim(bind)[2], dim(bind)[1], dim(bind)[2]))/255



sigma = (t(bind) %*% bind)/dim(bind)[1]
UV <- eigen(sigma)

#begin whitening
bindRotate <- bind %*% UV$vectors
1/(sqrt(UV$values + 0.1)) -> A
t(matrix(A, dim(bindRotate)[2], dim(bindRotate)[1])) -> B
bindRotate <- bindRotate * B
#end whitening

su <- sum(UV$values)
ret <- 0
for (i in 1:784) {
  ret = ret + UV$values[i];
  if (ret/su >= 0.99) {
    dimension = i
    break
  }
}

bind <- bindRotate[, 1:dimension]

train <- bind[1:42000, ]
test  <- bind[42001:70000, ]
#write.csv(train, "newTrain.csv", row.names = FALSE)
#write.csv(test, "newTest.csv", row.names = FALSE)
#end PCA and whitening

train <- (cbind(1, train))
test  <- (cbind(1, test))

train <- t(train)
test  <- t(test)

X <- train
Y <- train_label