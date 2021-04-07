ExploratoryDataAnalysis <- function(){
  
  res_data <- mainEDA(input_parameter,input_file,output_file)
  data <- res_data$data
  
  if(input_parameter$miRNA == "yes"){
    
    res_data_miRNA <- mainEDA(input_parameter,input_file,output_file,flag=T)
    
    dataCombined <- combineMatrices(res_data,res_data_miRNA)
    
    save(dataCombined, file = output_file$filename_dataCombined)
    
    data <- dataCombined
    
  }
  
  return(data)
  
}

