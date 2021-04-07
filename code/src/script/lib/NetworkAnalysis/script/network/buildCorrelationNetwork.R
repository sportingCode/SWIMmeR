buildCorrelationNetwork <- function(network,threshold_corr,threshold_pval_adj,
                                    output_file_CorrelationNetwork,
                                    output_file_CorrelationNetwork_R,save=F){
  
  ind <- which((abs(network$correlation) >= threshold_corr) & 
                 (network$pval_adj <= threshold_pval_adj))
  
  network <- network[ind,]
  
  if(save){
    
    write.table(network, output_file_CorrelationNetwork, sep="\t", 
                row.names = F, col.names = T, quote = F)
    
    save(network, file = output_file_CorrelationNetwork_R)
    
  }
  
  return(network)
  
}