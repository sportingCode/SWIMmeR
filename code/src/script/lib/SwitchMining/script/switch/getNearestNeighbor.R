getNearestNeighbor <- function(cartography,attribute_switch,w_adj,idx,tag,output_file_name,
                               output_file_corr,output_file_cluster){
  
  ########################################
  # input parameters
  
  node <- cartography$attribute$node
  switch <- attribute_switch$node
  
  mat <- w_adj[switch,node]
  ########################################
  # name nn
  
  l <- lapply(rownames(mat),function(x){
    
    if(tag == "pos"){
      ind <- which(mat[x,] > 0)
    }else if(tag == "neg"){
      ind <- which(mat[x,] < 0)
    }
    
    name <- colnames(mat)[ind]
    
  })
  
  M <- max(sapply(l,length))
  
  name_nn <- data.frame(rownames(mat),t(stri_list2matrix(l, fill = " ")))
  colnames(name_nn) <- c("switch",as.character(seq(1:M)))
  
  write.table(name_nn, output_file_name, row.names = F, col.names = T, sep = "\t", quote = F)
  ########################################
  # corr nn
  
  l <- lapply(rownames(mat),function(x){
    
    if(tag == "pos"){
      ind <- which(mat[x,] > 0)
    }else if(tag == "neg"){
      ind <- which(mat[x,] < 0)
    }
    
    corr <- mat[x,ind]
    mean_corr <- mean(corr)
    
    c <- c(mean_corr,corr)
    
  })
  
  corr_nn <- data.frame(rownames(mat),t(stri_list2matrix(l, fill = " ")))
  colnames(corr_nn) <- c("switch","mean correlation",as.character(seq(1:M)))
  
  write.table(corr_nn, output_file_corr, row.names = F, col.names = T, sep = "\t", quote = F)
  ########################################
  # cluster nn
  
  l <- lapply(rownames(mat),function(x){
    
    if(tag == "pos"){
      ind <- which(mat[x,] > 0)
    }else if(tag == "neg"){
      ind <- which(mat[x,] < 0)
    }
    
    name <- colnames(mat)[ind]
    
    cluster <- as.numeric(idx[name,])
    
  })
  
  cluster_nn <- data.frame(rownames(mat),t(stri_list2matrix(l, fill = " ")))
  colnames(cluster_nn) <- c("switch",as.character(seq(1:M)))
  
  write.table(cluster_nn, output_file_cluster, row.names = F, col.names = T, sep = "\t", quote = F)
  
}