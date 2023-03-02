computeClusterConnectivity <- function(adj,idx){
  
  ########################################
  adj[adj != 0] <- 1
  diag(adj) <- 0
  
  node <- rownames(idx)
  ########################################
  
  cluster <- split(idx,idx$cluster)
  
  cluster_connectivity <- sapply(names(cluster), function(x){
    
    member <- rownames(cluster[[x]])
    not_member <- setdiff(node,member)
    
    adj_in <- adj[member,member]
    adj_out <- adj[member,not_member]
    
    deg_in <- sum(adj_in)/2
    deg_out <- sum(adj_out)
    
    deg_tot <- deg_in + deg_out
    
    P <- length(member) / length(node)
    
    CC <- deg_in / (deg_tot + P) * 100
    CC <- signif(CC,3)
    
  })
  
  return(cluster_connectivity)
  
}