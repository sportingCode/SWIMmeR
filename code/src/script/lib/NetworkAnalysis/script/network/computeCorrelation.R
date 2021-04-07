computeCorrelation <- function(data,type,method){
  
  res <- rcorr(t(data), type = type)
  
  rho <- res$r
  pval <- res$P
  
  pval_adj <- p.adjust(pval, method = method)
  
  pval_adj <- matrix(pval_adj, ncol = ncol(pval), 
                     dimnames = list(row = row.names(rho), col = colnames(rho)))
  
  ut <- upper.tri(rho)
  
  df <- data.frame(source = rownames(rho)[row(rho)[ut]],
                   target = rownames(rho)[col(rho)[ut]],
                   correlation  = rho[ut],
                   pval = pval[ut],
                   pval_adj = pval_adj[ut])
  
  return(df)
  
}

