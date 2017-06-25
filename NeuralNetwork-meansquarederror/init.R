epsilon <- 0.09

NUMBER_THETA_ROW1 <- 50
NUMBER_THETA_COL1 <- 785

NUMBER_THETA_ROW2 <- 10
NUMBER_THETA_COL2 <- 51

theta1 <- matrix( 0, NUMBER_THETA_ROW1, NUMBER_THETA_COL1)
theta2 <- matrix( 0, NUMBER_THETA_ROW2, NUMBER_THETA_COL2)

for (i in 1:NUMBER_THETA_COL1) {
  theta1[, i] <- runif(NUMBER_THETA_ROW1, min = 0 , max = 1) * 2 * epsilon - epsilon
}


for (i in 1:NUMBER_THETA_COL2) {
    theta2[, i] <- runif(NUMBER_THETA_ROW2, min = 0 , max = 1) * 2 * epsilon - epsilon
}

alpha <- 1
lambda <- 1

X <- train
Y <- train_label
