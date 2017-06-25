gradientConvex <- function(X, Y, Theta) {
  probs = h_x(t(X), Theta)
  delta_theta <- -1/dim(X)[1] * (t(X) %*% t(Y - probs))
  return(delta_theta)
}