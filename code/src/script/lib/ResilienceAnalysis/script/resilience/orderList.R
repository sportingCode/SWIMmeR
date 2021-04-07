orderList <- function(list,degree,N){
  
  degree_list <- degree[list]
  
  degree_list <- degree_list[order(degree_list, decreasing = T)]
  
  ordered_list <- names(degree_list)
  
  ordered_list <- ordered_list[1:N]
  
  return(ordered_list)
  
}