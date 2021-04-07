getPreprocessing <- function(log_data,stat,threshold_prc_iqr,threshold_perc_zeros){
  
  ########################################
  # input parameters
  
  data <- log_data$data
  data_control <- log_data$data_control
  data_case <- log_data$data_case
  
  IQR <- stat$IQR
  perc_zeros <- stat$perc_zeros
  logFC <- stat$logFC
  pval <- stat$pval
  pval_adj <- stat$pval_adj
  ########################################
  
  ind_iqr <- which(IQR <= quantile(IQR,threshold_prc_iqr))
  
  if(length(ind_iqr) > 0){
    
    data  <- data[-ind_iqr,]
    data_control <- data_control[-ind_iqr,]
    data_case <- data_case[-ind_iqr,]
    
    IQR <- IQR[-ind_iqr]
    perc_zeros <- perc_zeros[-ind_iqr]
    logFC <- logFC[-ind_iqr]
    pval <- pval[-ind_iqr]
    pval_adj <- pval_adj[-ind_iqr]
    
  }
  ########################################
  
  ind_perc_zeros <- which(perc_zeros > threshold_perc_zeros)
  
  if(length(ind_perc_zeros) > 0){
    
    data  <- data[-ind_perc_zeros,]
    data_control <- data_control[-ind_perc_zeros,]
    data_case <- data_case[-ind_perc_zeros,]
    
    IQR <- IQR[-ind_perc_zeros]
    perc_zeros <- perc_zeros[-ind_perc_zeros]
    logFC <- logFC[-ind_perc_zeros]
    pval <- pval[-ind_perc_zeros]
    pval_adj <- pval_adj[-ind_perc_zeros]
    
  }
  ########################################
  
  res <- list(data = data,
              data_control = data_control,
              data_case = data_case,
              IQR = IQR, 
              perc_zeros = perc_zeros, 
              logFC = logFC, 
              pval = pval, 
              pval_adj = pval_adj)
  
  return(res)
  
}