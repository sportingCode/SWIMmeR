mainEDA <- function(input_parameter,input_file,output_file,flag=F){
  
  ########################################
  # input parameters
  
  paired_ttest <- input_parameter$paired_ttest
  correction_method <- input_parameter$correction_method
  
  if(!flag){
    
    data <- input_file$data
    control <- input_file$control
    case <- input_file$case
    
    threshold_prc_iqr <- input_parameter$threshold_prc_iqr
    threshold_perc_zeros <- input_parameter$threshold_perc_zeros
    threshold_fc <- input_parameter$threshold_fc
    threshold_pval_adj <- input_parameter$threshold_pval_adj
    
    output_file_stat_dataORIG<- output_file$filename_stat_dataORIG
    output_file_stat_dataFiltered <- output_file$filename_stat_dataFiltered
    output_file_dataFiltered <- output_file$filename_dataFiltered
    
    output_file_VolcanoPlot <- output_file$filename_VolcanoPlot
    output_file_heatmap <- output_file$filename_heatmap_DE
    
    title <- "RNA"
    
  }else if(flag){
    
    data <- input_file$data_miRNA
    control <- input_file$control_miRNA
    case <- input_file$case_miRNA
    
    threshold_prc_iqr <- input_parameter$threshold_prc_iqr_miRNA
    threshold_perc_zeros <- input_parameter$threshold_perc_zeros_miRNA
    threshold_fc <- input_parameter$threshold_fc_miRNA
    threshold_pval_adj <- input_parameter$threshold_pval_adj_miRNA
    
    output_file_stat_dataORIG <- output_file$filename_stat_dataORIG_miRNA
    output_file_stat_dataFiltered <- output_file$filename_stat_dataFiltered_miRNA
    output_file_dataFiltered <- output_file$filename_dataFiltered_miRNA
    
    output_file_VolcanoPlot <- output_file$filename_VolcanoPlot_miRNA
    output_file_heatmap <- output_file$filename_heatmap_DE_miRNA
    
    title <- "miRNA"
    
  }
  ########################################
  
  M <- ncol(data)
  N <- length(control)
  
  log_data <- getLogData(data,N,M)
  
  stat <- computeStat(log_data,N,M,paired_ttest,correction_method,output_file_stat_dataORIG)
  
  data.preProcessed <- getPreprocessing(log_data,stat,threshold_prc_iqr,threshold_perc_zeros)
  
  data.Filtered <- getFiltering(data.preProcessed,N,M,paired_ttest,correction_method,
                                threshold_fc,threshold_pval_adj,
                                output_file_stat_dataFiltered,output_file_dataFiltered)
  
  makeFigure(stat,data.preProcessed,data.Filtered,
             threshold_prc_iqr,threshold_perc_zeros,threshold_fc,threshold_pval_adj,
             output_file_VolcanoPlot,output_file_heatmap,title)
  
  return(data.Filtered)
  
}