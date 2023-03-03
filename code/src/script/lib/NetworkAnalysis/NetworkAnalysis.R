NetworkAnalysis <- function(data,checkNetIntegrity,screePlot){
  
  ########################################
  # input parameters
  
  type_correlation <-  input_parameter$type_correlation
  correction_method <- input_parameter$correction_method
  threshold_prc_corr <- input_parameter$threshold_prc_corr
  threshold_pval_adj <- input_parameter$threshold_pval_adj
  min_rho <- input_parameter$min_rho
  max_rho <- input_parameter$max_rho
  step_rho <- input_parameter$step_rho
  num_clusters <- input_parameter$num_clusters
  iter_max <- input_parameter$iter_max
  num_repeats <- input_parameter$num_repeats
  
  output_file_connectedComponent <- output_file$filename_connectedComponent
  output_file_CorrelationNetwork <- output_file$filename_CorrelationNetwork
  output_file_CorrelationNetwork_R <- output_file$filename_CorrelationNetwork_R
  output_file_weighted_adjMatrix <- output_file$filename_weighted_adjMatrix
  output_file_idx <- output_file$filename_idx
  ########################################
  
  corr_edge_list <- computeCorrelation(data,type_correlation,correction_method)
  
  threshold_corr <- quantile(corr_edge_list$correlation,threshold_prc_corr)
  threshold_corr <- round(as.numeric(threshold_corr),digits=4)
  
  getHistogram(corr_edge_list$correlation,threshold_corr,title="","Correlation")
  
  if(checkNetIntegrity) checkNetworkIntegrity(corr_edge_list,min_rho,max_rho,step_rho,
                                              threshold_pval_adj,threshold_corr,
                                              output_file_connectedComponent)
  
  network <- buildCorrelationNetwork(corr_edge_list,threshold_corr,threshold_pval_adj,
                                     output_file_CorrelationNetwork,
                                     output_file_CorrelationNetwork_R,save=T)
  
  w_adj <- createWeightedAdjMatrix(network,output_file_weighted_adjMatrix)
  
  num_node <- nrow(w_adj)
  num_edge <- nrow(network)
  
  if(screePlot) getScreePlot(w_adj)
  
  clustering <- getClustering(w_adj,num_clusters,iter_max,num_repeats,output_file_idx)
  
  res <- list(network = network,
              num_node = num_node, 
              num_edge = num_edge,
              w_adj = w_adj,
              threshold_corr = threshold_corr,
              cluster_size = clustering$size,
              idx = clustering$idx,
              cluster_score = clustering$cluster_score,
              partition_score = clustering$partition_score)
  
  return(res)
  
}