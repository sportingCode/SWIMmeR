computeAPCC <- function(w_adj){
  
  w_adj[w_adj==0] <- NA
  
  APCC <- data.frame(APCC = rowMeans(w_adj,na.rm = T))
  
  return(APCC)
  
}