getHistogram <- function(x,threshold,title,xlabel){
  
  df <- data.frame(variable = x)
  
  df$legend <- ifelse( (abs(x) <= threshold), "delete", "accept")
  
  w <- (max(x) - min(x)) / 100
  
  p = ggplot(df, aes(variable, fill = legend)) + geom_histogram(binwidth = w, colour='black') + 
    scale_x_continuous(expand = c(0, 0)) + scale_y_continuous(expand = c(0, 0)) + 
    scale_fill_manual(values = c("delete" = "darkgrey", "accept" = "red")) + 
    theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
          panel.background = element_blank(), axis.line = element_line(colour = "black"), 
          plot.title = element_text(hjust = 0.5, face = "bold"),
          legend.title = element_text(colour = "black", size=10, face="bold"),
          legend.key.height = unit(0.2, "cm"),legend.key.width = unit(1, "cm"),
          legend.box.background = element_rect(colour = "black")) +
    labs(title = title, x = xlabel)
  
  print(p)
  
}

