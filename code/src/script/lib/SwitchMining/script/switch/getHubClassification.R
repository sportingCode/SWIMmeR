getHubClassification <- function(APCC,deg){
  
  condition1 <- (APCC$APCC > 0) & (APCC$APCC < 0.5) & (deg$deg >= 5)
  condition2 <- (APCC$APCC >= 0.5) & (deg$deg >= 5)
  condition3 <- (APCC$APCC < 0) & (deg$deg >= 5)
  condition4 <- (deg$deg < 5)
  
  hub_class <- data.frame(hub = ifelse(condition1,"DATE",
                                       ifelse(condition2,"PARTY",
                                              ifelse(condition3,"FIGHT CLUB",
                                                     ifelse(condition4,"no hub","not available")))))
  rownames(hub_class) <- rownames(deg)
  
  return(hub_class)
  
}