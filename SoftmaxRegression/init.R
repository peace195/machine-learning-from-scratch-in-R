#Random Init parameters (theta), input 784, ouput 10 and
#theta is a matrix with size 784 x 10
epsilon <- 1/1000
theta <- matrix( 0, 785, 10)
for (i in 1:10) {
  theta[, i] <- runif(785, 0 , epsilon)
}

alpha <- 0.00001


