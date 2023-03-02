getClustering <- function(w_adj,num_clusters,iter_max,num_repeats,output_file_idx){
  
  ########################################
  # library(LICORS)
  # m <- kmeanspp(w_adj, k = num_clusters)
  # inicial.centers <- m$inicial.centers
  # 
  #  library(amap)
  # model <- Kmeans(w_adj, centers = inicial.centers, iter.max = iter_max,
  #                 nstart = num_repeats, method = "euclidean")
  ########################################
  
  model <- kmeans(w_adj, centers = num_clusters, iter.max = iter_max, nstart = num_repeats)
  
  WSS <- model$withinss        # Within-cluster Sum of Square (i.e. the compactness of the each cluster)
  TWSS <- model$tot.withinss   # Total Within-cluster Sum of Square, i.e. SSE = TWSS = sum(WSS)
  TSS <- model$totss           # the Total Sum of Squares (i.e. the compactness of the whole network)
  BSS <- model$betweenss       # the Between Sum of Squares, i.e. BSS = TSS - TWSS
  size <- model$size
  idx <- data.frame(cluster = as.factor(model$cluster))
  ########################################
  
  cluster_connectivity <- computeClusterConnectivity(w_adj,idx)
  
  cluster_compactness <- (1 - WSS/TSS) * 100
  cluster_compactness <- signif(cluster_compactness,3)

  partition_quality <- BSS / TSS * 100  # (TSS - TWSS)/TSS *100 = (1 - TWSS/TSS) * 100
  partition_quality <- signif(partition_quality,3)
  
  # The higher the percentage, the better the quality of the k-means partition
  # (i.e. BSS is large and/or TWSS is small)
  # The smaller TWSS, the more compact the clusters (close to the centroids)
  ########################################
  
  write.table(idx, output_file_idx, sep="\t", row.names = T, col.names = NA, quote = F)
  
  res <- list(size = size, idx = idx, 
              cluster_connectivity = cluster_connectivity,
              cluster_compactness = cluster_compactness,
              partition_quality = partition_quality)
  
  return(res)
  
}