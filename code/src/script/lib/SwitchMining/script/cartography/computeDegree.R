computeDegree <- function(adj,idx){
  
  C <- createClusterMatrix(idx,adj)
  
  adj[adj!=0] = 1 
  
  zc <-  C * adj
  
  deg <- data.frame(deg = rowSums(adj))
  ideg <- data.frame(ideg = rowSums(zc))
  
  res <- list(deg = deg, ideg = ideg)
  
  return(res)
  
}
