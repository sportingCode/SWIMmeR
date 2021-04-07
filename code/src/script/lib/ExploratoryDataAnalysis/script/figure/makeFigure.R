makeFigure <- function(stat,data.preProcessed,data.Filtered,threshold_prc_iqr,
                       threshold_perc_zeros,threshold_fc,threshold_pval_adj,
                       output_file_VolcanoPlot,output_file_heatmap,title){
  
  ########################################
  # input parameters
  
  threshold_iqr <- quantile(stat$IQR,threshold_prc_iqr)
  
  log2_threshold_fc <- log2(threshold_fc)
  ########################################
  
  getHistogram(stat$IQR,threshold_iqr,title,"Interquartile Range (IQR)")
  
  getScatterPlot(stat$IQR,stat$perc_zeros,threshold_prc_iqr,threshold_perc_zeros,title)
  
  getHistogram(data.preProcessed$logFC,log2_threshold_fc,title,"Log2 Fold-change (FC)")
  
  getVolcanoPlot(data.preProcessed$logFC,data.preProcessed$pval_adj,
                 threshold_fc,threshold_pval_adj,title,output_file_VolcanoPlot)
  
  getHeatmap(data.Filtered,output_file_heatmap,title)
  
}