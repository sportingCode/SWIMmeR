makeFigureSwitch <- function(cartography,attribute_switch,output_file){
  
  ########################################
  # input parameters
  
  switch <- attribute_switch$node
  attribute <- cartography$attribute
  
  dataFiltered <- get(load(output_file$filename_dataFiltered))
  
  if(input_parameter$miRNA == "yes") dataFiltered_miRNA <- get(load(output_file$filename_dataFiltered_miRNA))
    
  output_file_heatmap_switch <- output_file$filename_heatmap_switch
  output_file_heatmap_switch_miRNA <- output_file$filename_heatmap_switch_miRNA
  output_file_APCC_distribution <- output_file$filename_APCC_distribution
  output_file_HeatCartography<- output_file$filename_HeatCartography
  ########################################
  
  getAPCCdistribution(attribute,output_file_APCC_distribution)
  
  getHeatCartography(attribute,output_file_HeatCartography)
  
  ind <- which(rownames(dataFiltered$data) %in% switch)
  
  data <- dataFiltered$data[ind,]
  data_control <- dataFiltered$data_control[ind,]
  data_case <- dataFiltered$data_case[ind,]
  
  data_switch <- list(data = data, data_control = data_control, data_case = data_case)
  
  getHeatmap(data_switch,output_file_heatmap_switch,"Switch RNA")
  
  if(input_parameter$miRNA == "yes"){
    
    ind <- which(rownames(dataFiltered_miRNA$data) %in% switch)
    
    data <- dataFiltered_miRNA$data[ind,]
    data_control <- dataFiltered_miRNA$data_control[ind,]
    data_case <- dataFiltered_miRNA$data_case[ind,]
    
    data_switch_miRNA <- list(data = data, data_control = data_control, data_case = data_case)
    
    getHeatmap(data_switch_miRNA,output_file_heatmap_switch_miRNA,"Switch miRNA")
    
  }
    
}