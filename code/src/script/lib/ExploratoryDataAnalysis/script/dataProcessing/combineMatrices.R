combineMatrices <- function(list,list_miRNA){
  
  ########################################
  # input parameters
  
  data <- list$data
  data_miRNA <- list_miRNA$data
  
  control <- colnames(list$data_control)
  case <- colnames(list$data_case)
  ########################################
  
  colnames(data) <- c(rep("control",length(control)), rep("case",length(case)))
  
  colnames(data_miRNA) <- colnames(data)
  
  data <- rbind(data,data_miRNA)
  
  return(data)
  
}
