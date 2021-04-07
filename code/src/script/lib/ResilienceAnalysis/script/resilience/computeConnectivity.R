computeConnectivity <- function(network){
  
  graph <- graph_from_data_frame(network, directed = F)
  
  graph <- simplify(graph, remove.multiple = TRUE, remove.loops = TRUE,
                    edge.attr.comb = igraph_opt("edge.attr.comb"))
  
  node <- names(V(graph))
  
  degree <- degree(graph, v = V(graph))
  
  component <- components(graph)
  
  ind <- which(component$membership == which.max(component$csize))
  
  matrix_sp <- distances(graph, v = V(graph)[ind], to = V(graph)[ind])
  
  matrix_sp[upper.tri(matrix_sp)] <- NA
  diag(matrix_sp) <- NA
  
  mean_sp <- mean(matrix_sp, na.rm = T)
  
  res <- list(node = node, degree = degree, mean_sp = mean_sp)
  
  return(res)
  
}