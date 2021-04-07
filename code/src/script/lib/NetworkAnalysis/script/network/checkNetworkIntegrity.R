checkNetworkIntegrity <- function(corr_edge_list,min_rho,max_rho,step_rho,
                                  threshold_pval_adj,threshold_corr,output_file){
  
  range <- seq(min_rho,max_rho,step_rho)
  
  l <- lapply(range,function(x){
    
    network <- buildCorrelationNetwork(corr_edge_list,x,threshold_pval_adj,"","")
    
    frac_node_LCC <- computeNetworkIntegrity(network)
    
    df <- data.frame(threshold_corr = x,
                     frac_node_LCC = frac_node_LCC)
    
  })
  
  net_integrity <- rbindlist(l)
  
  getNetworkIntegrityPlot(net_integrity,min_rho,max_rho,threshold_corr,output_file)
  
}