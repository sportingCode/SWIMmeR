getSwitch <- function(attribute,output_file){
  
  ########################################
  # input parameters
  
  output_file_attribute_switch <- output_file$filename_attribute_switch
  output_file_switch <- output_file$filename_switch
  ########################################
  
  ind <- which(attribute$Region == "R4" & 
                 attribute$Hub_classification == "FIGHT CLUB")
  
  attribute_switch <- attribute[ind,]
  
  switch <- attribute_switch$node
  
  write.table(attribute_switch, output_file_attribute_switch , row.names = F, col.names = T, sep = "\t", quote = F)
  write.table(switch, output_file_switch, row.names = F, col.names = F, sep = "\t", quote = F)

  return(attribute_switch)
  
}