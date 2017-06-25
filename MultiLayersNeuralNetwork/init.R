epsilon <- 0.09

NUMBER_THETA_ROW1 <- 150
NUMBER_THETA_COL1 <- 785

NUMBER_THETA_ROW2 <- 40
NUMBER_THETA_COL2 <- 151

NUMBER_THETA_ROW3 <- 10
NUMBER_THETA_COL3 <- 41

theta1 <- matrix( 0, NUMBER_THETA_ROW1, NUMBER_THETA_COL1)
theta2 <- matrix( 0, NUMBER_THETA_ROW2, NUMBER_THETA_COL2)
theta3 <- matrix( 0, NUMBER_THETA_ROW3, NUMBER_THETA_COL3)


for (i in 1:NUMBER_THETA_COL1) {
  theta1[, i] <- runif(NUMBER_THETA_ROW1, min = 0, max =  1) * 2 * epsilon - epsilon
}


for (i in 1:NUMBER_THETA_COL2) {
  theta2[, i] <- runif(NUMBER_THETA_ROW2,  min = 0, max =  1) * 2 * epsilon - epsilon
}

for (i in 1:NUMBER_THETA_COL3) {
  theta3[, i] <- runif(NUMBER_THETA_ROW3,  min = 0, max =  1) * 2 * epsilon - epsilon
}

alpha <- 1
lambda <- 10




