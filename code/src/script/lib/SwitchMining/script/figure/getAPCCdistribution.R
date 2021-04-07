getAPCCdistribution <- function(attribute,output_file){
  
  m <- min(attribute$APCC) - 0.1
  M <- max(attribute$APCC) + 0.1
  
  ind <- which(attribute$Hub_classification == "no hub")
  if(length(ind) > 0) attribute <- attribute[-ind,]
  
  p <- ggplot(attribute, aes(x=APCC)) + geom_density(color="darkblue", fill="lightblue") +
    scale_x_continuous(expand = c(0, 0), limits = c(m,M)) + scale_y_continuous(expand = c(0, 0)) +
    theme(panel.background = element_rect(fill = "white", colour = "black", size = 1)) +
    labs(x = "Average Pearson Correlation Coefficient (APCC)", y = "Probability density")
  
  print(p)
  
  savePDF(p,output_file)
  
}

