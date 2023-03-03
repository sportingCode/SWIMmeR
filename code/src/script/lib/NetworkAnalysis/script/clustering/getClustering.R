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
  
  WSS <- model$withinss        # Within-cluster Sum of Squares (sum of squared distances from each centroid) 
  TWSS <- model$tot.withinss   # Total Within-cluster Sum of Squares (SSE = TWSS = sum(WSS))
  TSS <- model$totss           # the Total Sum of Squares (sum of squared distances from the network centroid)
  BSS <- model$betweenss       # the Between Sum of Squares (BSS = TSS - TWSS)
  size <- model$size
  idx <- data.frame(cluster = as.factor(model$cluster))

  # The smaller WSS, the more compact the cluster, the higher the score
  cluster_score <- (1 - WSS/TSS) * 100
  cluster_score <- signif(cluster_score,3)

  # The smaller TWSS (or the larger BSS), the better the k-means partition, the higher the score
  partition_score <- BSS / TSS * 100  # (1 - TWSS/TSS) * 100
  partition_score <- signif(partition_score,3)
  ########################################
  
  write.table(idx, output_file_idx, sep="\t", row.names = T, col.names = NA, quote = F)
  
  res <- list(size = size, idx = idx, 
              cluster_score = cluster_score,
              partition_score = partition_score)
  
  return(res)
  
}