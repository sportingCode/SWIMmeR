getResiliencePlot <- function(df,output_file){
  
  M <- max(df$frac) + 0.05
  
  p1 <- ggplot(df, aes(x = frac)) + scale_x_continuous(expand = c(0, 0), limits = c(0,M)) +
    scale_y_continuous(expand = c(0, 0)) +
    geom_line(aes(y = no_switch_hub, color = "no_switch_hub"), size = 1) +
    geom_line(aes(y = switch, color = "switch"), size = 1) +
    geom_line(aes(y = random, color = "random"), size = 1) +
    scale_colour_manual(name = "", values = c(no_switch_hub = "blue", "switch" = "red", "random" = "green")) +
    theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
          panel.background = element_blank(), #axis.title = element_text(face = "bold"),
          axis.line = element_line(colour = "black"),
          legend.key = element_rect(fill = "white", colour = "white")) +
    labs(x = "Fraction of removed nodes", y = "Average shortest path")
  
  p2 <- ggplot(df, aes(x = frac)) + scale_x_continuous(expand = c(0, 0), limits = c(0,M)) +
    scale_y_continuous(expand = c(0, 0)) +
    geom_line(aes(y = hub, color = "hub"), size = 1) +
    geom_line(aes(y = date, color = "date"), size = 1) +
    geom_line(aes(y = party, color = "party"), size = 1) +
    geom_line(aes(y = fight_club, color = "fight_club"), size = 1) +
    geom_line(aes(y = random, color = "random"), size = 1) +
    scale_colour_manual(name = "", values = c(hub = "magenta", "date" = "black", "party" = "blue", "fight_club" = "red", "random" = "green")) +
    theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
          panel.background = element_blank(), #axis.title = element_text(face = "bold"),
          axis.line = element_line(colour = "black"),
          legend.key = element_rect(fill = "white", colour = "white")) +
    labs(x = "Fraction of removed nodes", y = "Average shortest path")
  
  grid.arrange(p1, p2, ncol=2) 
  
  p <- arrangeGrob(p1, p2, ncol=2)
  
  ggsave(output_file,p)
  
}