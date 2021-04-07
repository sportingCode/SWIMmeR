computeStat <- function(log_data,N,M,paired,method,output_file_stat_dataORIG){
  
  ########################################
  # input parameters
  
  data <- log_data$data
  data_control <- log_data$data_control
  data_case <- log_data$data_case
  ########################################
  
  IQR <- apply(data,1,IQR,type=5)
  
  perc_zeros <- apply(data, 1, function(x){ length(which(x == 0)) / length(x) * 100 })
  
  logFC <- rowMeans(data_case) - rowMeans(data_control)
  
  pval <- apply(data, 1, function(data){
    t.test(data[1:N], data[(N+1):M], paired = paired)$p.value
  })
  
  pval_adj <- p.adjust(pval, method = method)
  
  df_stat <- data.frame(IQR = IQR,
                        perc_zeros = perc_zeros,
                        logFC = logFC,
                        pval = pval,
                        pval_adj = pval_adj)
  
  write.table(df_stat, output_file_stat_dataORIG, row.names = T, col.names = NA, sep = "\t", quote = F)
  
  return(df_stat)
  
}