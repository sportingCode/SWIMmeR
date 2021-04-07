getLogData <- function(data,N,M){
  
  data <- log2(data + 1)
  
  data_control <- data[,1:N]
  data_case <- data[,(N+1):M]
  
  log_data <- list(data = data,
                   data_control = data_control,
                   data_case = data_case)
  
  return(log_data)
  
}