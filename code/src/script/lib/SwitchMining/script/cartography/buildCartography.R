buildCartography <- function(df_stat,idx,res_deg,APCC,hub_class,network,output_file_attribute,
                             output_file_CartographyNetwork,output_file_CartographyNetwork_R){
  
  deg <- res_deg$deg
  ideg <- res_deg$ideg
  
  cluster <- split(idx,idx$cluster)
  
  cluster_info <- lapply(names(cluster),function(k){
    
    y <- rownames(cluster[[k]])
    
    parameter <- computePz(y,deg,ideg)
    P <- parameter$P
    z <- parameter$z
    
    role <- getNodeRole(y,z,P)
    
    df <- data.frame(y,role$hub,role$region,role$type,deg[y,],ideg[y,],APCC[y,],hub_class[y,],P,z,k)
    colnames(df) <- c("node", "Hub", "Region", "Type", "Total_Degree", "Internal_Degree",
                      "APCC", "Hub_classification", "P", "z", "Cluster_ID")
    
    return(df)
    
  })
  
  attribute <- data.frame(rbindlist(cluster_info))
  
  ind <- which( (attribute$`Total Degree` == 0) | (attribute$`Internal Degree` == 0) )
  
  if(length(ind)>0){
    
    node_to_remove <- attribute$node[ind]
    
    found <- which( (network$source %in% node_to_remove) | (network$target %in% node_to_remove) )
    network <- network[-found,]
    
    attribute <- attribute[-ind,]
    
  }
  
  attribute <- merge(attribute, df_stat, by.x = "node", by.y = 0, all = F)
  
  write.table(attribute, output_file_attribute, row.names = F, col.names = T, sep = "\t", quote = F)
  write.table(network, output_file_CartographyNetwork, row.names = F, col.names = T, sep = "\t", quote = F)
  
  save(network, file = output_file_CartographyNetwork_R)
  
  res <- list(attribute = attribute, num_node = nrow(attribute), num_edge = nrow(network))
  
  return(res)
  
}

