removeNode <- function(list,network,mean_sp,N,M,output_file){
  
  node_to_remove <- vector(mode = "numeric")
  
  connectivity <- data.frame(frac = 0, mean_sp = mean_sp)
  
  for(i in 1:N){
    
    node_to_remove <- c(node_to_remove,list[i])
    
    ind <- which( (network$source %in% node_to_remove) | (network$target %in% node_to_remove))
    
    network <- network[-ind,]
    
    net_info <- computeConnectivity(network)
    
    ratio <- length(node_to_remove) / M
    
    asp <- net_info$mean_sp
    
    df <- data.frame(frac = ratio, mean_sp = asp)
    
    connectivity <- rbind(connectivity,df)
    
    ind <- which(!is.finite(connectivity$mean_sp))

    if(length(ind) > 0) connectivity <- connectivity[-ind,]
    
  }
  
  save(connectivity, file = output_file)
  
  return(connectivity)
  
}