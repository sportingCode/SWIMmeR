createClusterMatrix <- function(idx,w_adj){
  
  cluster <- split(idx,idx$cluster)
  
  l <- lapply(cluster,function(x){
    
    y <- rownames(x)
    pairs <- data.frame(expand.grid(y,y))
    
  })
  
  pairs <- rbindlist(l)
  colnames(pairs) <- c("source","target")
  
  graph <- graph_from_data_frame(pairs, directed = F)
  
  graph <- simplify(graph, remove.multiple = TRUE, remove.loops = TRUE,
                    edge.attr.comb = igraph_opt("edge.attr.comb"))
  
  C <- as.matrix(as_adj(graph, type = "both"))
  
  r <- match(rownames(w_adj),rownames(C))
  c <- match(colnames(w_adj),colnames(C))
  C <- C[r,c]
  
  return(C)
  
}



