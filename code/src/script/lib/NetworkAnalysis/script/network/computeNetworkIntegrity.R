computeNetworkIntegrity <- function(network){
  
  graph <- graph_from_data_frame(network, directed = F)
  
  graph <- simplify(graph, remove.multiple = TRUE, remove.loops = TRUE,
                    edge.attr.comb = igraph_opt("edge.attr.comb"))
  
  v_graph <- length(V(graph))
  
  component <- components(graph)
  
  ind <- which(component$membership == which.max(component$csize))
  
  LCC <- induced_subgraph(graph , V(graph)[ind])
  
  v_LCC <- length(V(LCC))
  
  frac_node_LCC <- v_LCC / v_graph
  
  return(frac_node_LCC)
  
}









