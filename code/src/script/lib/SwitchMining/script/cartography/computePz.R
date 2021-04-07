computePz <- function(y,deg,ideg){
  
  m <- mean(deg[y,])
  std <- sd(deg[y,])
  
  z <- (ideg[y,] - m) / std
  
  P <- 1 - (ideg[y,] / deg[y,])^2
  
  res <- list(P = P, z = z)
  
  return(res)
  
}