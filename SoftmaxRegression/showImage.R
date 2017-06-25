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

par(mfrow = c(3,3))
for (i in 1:9) {
  t(matrix(as.numeric(train[i, ]), nrow = 28, ncol = 28)) -> matrixOfPixel
  t(apply(matrixOfPixel , 2, rev)) -> matrixOfPixel
  image(z = matrixOfPixel, axes = FALSE, col = gray(0:255/255))
}

train <- cbind(1, train)
test  <- cbind(1, test)
#The visualization of test set is the same as training set