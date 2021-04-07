getVolcanoPlot <- function(logFC,pval_adj,threshold_fc,threshold_pval_adj,title,output_file){
  
  df <- data.frame(logFC = logFC, pval = -log10(pval_adj))
  
  condition1 <- (pval_adj <= threshold_pval_adj) & (logFC > log2(threshold_fc))
  condition2 <- (pval_adj <= threshold_pval_adj) & (logFC < -log2(threshold_fc))
  
  df$legend <- ifelse(condition1,"up",ifelse(condition2,"down","delete"))
  
  p <- ggplot(df, aes(x = logFC, y = pval, color = legend)) + geom_point() + 
    scale_x_continuous(expand = c(0, 0)) + scale_y_continuous(expand = c(0, 0)) +
    scale_color_manual(values = c("delete" = "darkgrey", "up" = "yellow", "down" = "blue"))  +
    theme(panel.background = element_rect(fill = "white", colour = "black", size = 1),
          plot.title = element_text(hjust = 0.5, face = "bold"),
          legend.title = element_text(colour = "black", size=10, face="bold"),
          legend.key = element_rect(fill = "white", colour = "white"),
          legend.box.background = element_rect(colour = "black")) + 
    labs(title = title, x = "Log2 Fold-change (FC)", y = "-Log10(adjusted p-value)") + 
    geom_hline(yintercept =  -log10(threshold_pval_adj), linetype = "dashed", color = "black") + 
    geom_vline(xintercept = log2(threshold_fc), linetype = "dashed", color = "black") +
    geom_vline(xintercept = -log2(threshold_fc), linetype = "dashed", color = "black")
  
  print(p)
  
  savePDF(p,output_file)
  
}