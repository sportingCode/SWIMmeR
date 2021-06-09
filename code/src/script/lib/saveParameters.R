saveParameters <- function(){
  
  parameters = c(input_parameter$dataset,
                 input_parameter$filename_CTRL,
                 input_parameter$filename_CASE,
                 input_parameter$paired_ttest,
                 input_parameter$correction_method,
                 input_parameter$threshold_prc_iqr,
                 input_parameter$threshold_perc_zeros,
                 input_parameter$threshold_fc,
                 input_parameter$threshold_pval_adj,
                 input_parameter$type_correlation,
                 input_parameter$threshold_prc_corr,
                 network$threshold_corr,
                 input_parameter$threshold_pval_adj_corr,
                 input_parameter$num_clusters,
                 network$num_node,network$num_edge,
                 switch$num_node,switch$num_edge,nrow(switch$attribute_switch))
  
  names <- c("dataset","filename_CTRL","filename_CASE","paired_ttest","correction_method",
             "threshold_prc_iqr","threshold_perc_zeros",
             "threshold_fc","threshold_pval_adj","type_correlation",
             "threshold_prc_corr","threshold_correlation","threshold_pval_adj_corr",
             "num_clusters","node","edge","node cartography","edge cartography","switch")
  
  if(input_parameter$miRNA == "yes"){
    
    parameters_miRNA = c(input_parameter$threshold_prc_iqr_miRNA,
                         input_parameter$threshold_perc_zeros_miRNA,
                         input_parameter$threshold_fc_miRNA,
                         input_parameter$threshold_pval_adj_miRNA)
    
    names_miRNA <- c("threshold_prc_iqr_miRNA","threshold_perc_zeros_miRNA",
                     "threshold_fc_miRNA","threshold_pval_adj_miRNA")
    
    parameters <- c(parameters,parameters_miRNA)
    names <- c(names,names_miRNA)
    
  }
  
  N <- length(parameters)
  
  init_config <- matrix(parameters,N,1)
  
  rownames(init_config) <- names
  
  save(init_config,file = output_file$filename_parameters)
  
}





