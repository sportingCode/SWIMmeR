getScatterPlot <- function(IQR,perc_zeros,threshold_prc_iqr,threshold_perc_zeros,title){
  
  no_null_el <- 100 - perc_zeros
  
  df <- data.frame(IQR = IQR, no_null_el = no_null_el)
  
  thr_iqr <- as.numeric(quantile(IQR,threshold_prc_iqr))
  thr_no_null_el <- 100 - threshold_perc_zeros
  
  condition1 <- (IQR <= thr_iqr) | (no_null_el < thr_no_null_el)
  condition2 <- (IQR > thr_iqr) & (no_null_el >= thr_no_null_el)
  
  df$legend <- ifelse(condition1,"delete",ifelse(condition2,"accept","delete"))
  
  p <- ggplot(df, aes(x = IQR, y = no_null_el, color = legend)) + geom_point() + 
    scale_x_continuous(expand = c(0, 0)) + scale_y_continuous(expand = c(0, 0)) +
    scale_color_manual(values = c("delete" = "darkgrey", "accept" = "red"))  +
    theme(panel.background = element_rect(fill = "white", colour = "black", size = 1),
          plot.title = element_text(hjust = 0.5, face = "bold"),
          legend.title = element_text(colour = "black", size=10, face="bold"),
          legend.key = element_rect(fill = "white", colour = "white"),
          legend.box.background = element_rect(colour = "black")) + 
    labs(title = title, x = "Interquartile Range (IQR)", y = "% of non-zero elements") + 
    geom_hline(yintercept = thr_no_null_el, linetype = "dashed", color = "black") + 
    geom_vline(xintercept = thr_iqr, linetype = "dashed", color = "black")  
  
  print(p)
  
}




