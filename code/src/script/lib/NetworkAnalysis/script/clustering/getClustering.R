getClustering <- function(w_adj,num_clusters,iter_max,num_repeats,output_file_idx){
  
  # library(LICORS)
  # m <- kmeanspp(w_adj, k = num_clusters)
  # inicial.centers <- m$inicial.centers
  # 
  #  library(amap)
  # model <- Kmeans(w_adj, centers = inicial.centers, iter.max = iter_max,
  #                 nstart = num_repeats, method = "euclidean")
  
  model <- kmeans(w_adj, centers = num_clusters, iter.max = iter_max, nstart = num_repeats)
  
  # BSS <- model$betweenss   # the Between Sum of Squares 
  # TSS <- model$totss       # the Total Sum of Squares
  
  # quality <- BSS / TSS * 100
  
  WSS <- model$withinss    # the Within-cluster Sum of Square
  TWSS <- model$tot.withinss # the Total Within-cluster Sum of Square
  
  size <- model$size
  
  idx <- data.frame(cluster = as.factor(model$cluster))
  
  write.table(idx, output_file_idx, sep="\t", row.names = T, col.names = NA, quote = F)
  
  res <- list(idx = idx, size = size, WSS = WSS, TWSS = TWSS)
  
  return(res)
  
}