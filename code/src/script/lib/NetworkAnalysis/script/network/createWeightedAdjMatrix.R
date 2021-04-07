createWeightedAdjMatrix <- function(network,output_file){
  
  source <- network$source
  target <- network$target
  interaction <- network$correlation
  
  nodi <- unique(c(source,target))
  
  N <- length(nodi)
  
  w_adj <- matrix(0,N,N)
  colnames(w_adj) <- nodi
  row.names(w_adj) <- nodi
  
  for(i in 1:N){
    
    ind <- which(source %in% nodi[i])
    
    M <- length(ind)
    if ( M > 0 ){
      for (k in 1:M){
        j <- which(nodi %in% target[ind[k]])
        w_adj[i,j] = interaction[ind[k]]
        w_adj[j,i] =  w_adj[i,j] 
      }
    }
    
  }
  
  save(w_adj,file = output_file)
  
  return(w_adj)
  
}
