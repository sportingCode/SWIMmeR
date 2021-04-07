getHeatCartography <- function(attribute,output_file){
  
  df <- attribute[,c("P","z","APCC")]
  
  m <- min(df$z) - 1
  M <- 3.5
  d <- 0.5
  
  my_color <- colorRampPalette(colors = c("blue4","blue","dodgerblue1","deepskyblue","cyan","greenyellow","yellow","orange","red","red2","red4"))(100)
  
  p <- ggplot(df, aes(x = P, y = z, color = APCC)) + geom_point() + 
    scale_x_continuous(expand = c(0, 0)) + scale_y_continuous(expand = c(0, 0)) +
    theme(panel.background = element_rect(fill = "white", colour = "black", size = 1)) +
    labs(x = "Clusterphobic coefficient", y = "Whithin-module degree") + 
    geom_line(data = data.frame(x = c(0, 1), y = 2.5), aes(x = x , y = y), 
              linetype = "solid", color = "black")  +
    geom_line(data = data.frame(x = 0.04, y = c(m, 2.5)), aes(x = x, y = y),
              linetype = "solid", color = "black") +
    geom_line(data = data.frame(x = 0.65, y = c(m, 2.5)), aes(x = x, y = y),
              linetype = "solid", color = "black") +
    geom_line(data = data.frame(x = 0.8, y = c(m, 2.5)), aes(x = x, y = y),
              linetype = "solid", color = "black") +
    geom_line(data = data.frame(x = 0.3, y = c(2.5,M)), aes(x = x, y = y),
              linetype = "solid", color = "black") +
    geom_line(data = data.frame(x = 0.75, y = c(2.5,M)), aes(x = x, y = y),
              linetype = "solid", color = "black") +
    annotate(geom="text", x = 0.1, y = m+d, label = "R1",
           color = "black", fontface = "bold") + 
    annotate(geom="text", x = 0.4, y = m+d, label = "R2",
             color = "black", fontface = "bold") + 
    annotate(geom="text", x = 0.73, y = m+d, label = "R3",
             color = "black", fontface = "bold") +
    annotate(geom="text", x = 0.9, y = m+d, label = "R4",
             color = "black", fontface = "bold") +
    annotate(geom="text", x = 0.15, y = M-d, label = "R5",
             color = "black", fontface = "bold") +
    annotate(geom="text", x = 0.55, y = M-d, label = "R6",
             color = "black", fontface = "bold") +
    annotate(geom="text", x = 0.85, y = M-d, label = "R7",
             color = "black", fontface = "bold") +
    geom_segment(aes(x = 0.07, y = m+d, xend = 0.015, yend = m+d), 
                 arrow = arrow(length = unit(0.2, "cm")), colour = "black") +
    scale_color_gradientn(colours = my_color, limits=c(-1,1))
  
  print(p)
  
  savePDF(p,output_file)
  
}
