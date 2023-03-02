getScreePlot <- function(w_adj){
  
  ########################################
  # input parameters
  
  num_clusters <- input_parameter$num_clusters
  iter_max <- input_parameter$iter_max
  num_repeats <- input_parameter$num_repeats
  ########################################
  
  # method = "wss" (for total within sum of square, i.e. SSE=sum(withinss)=TWSS)
  p <- fviz_nbclust(w_adj, kmeans, method = "wss", iter.max = iter_max, nstart = num_repeats) +
    geom_vline(xintercept = num_clusters, linetype = 2) + # add line for better visualisation
    labs(subtitle = "Elbow method") # add subtitle
  
  print(p)
  
}



