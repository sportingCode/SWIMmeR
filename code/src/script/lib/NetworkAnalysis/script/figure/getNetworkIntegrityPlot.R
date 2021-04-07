getNetworkIntegrityPlot <- function(df,min_rho,max_rho,threshold_corr,output_file){
  
  p <- ggplot(df, aes(x = threshold_corr, y = frac_node_LCC)) + 
    geom_line(color = "blue", size = 1) + scale_x_continuous(breaks=seq(min_rho,max_rho,0.1)) +
    theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
          panel.background = element_blank(), #axis.title = element_text(face = "bold"),
          axis.line = element_line(colour = "black")) + 
    labs(x = "Correlation threshold", y = "Largest Connected Component (node ratio)") + 
    geom_vline(xintercept = threshold_corr, linetype = "dashed", color = "red", size = 1)  
  
  print(p)
  
  savePDF(p,output_file)
  
}
