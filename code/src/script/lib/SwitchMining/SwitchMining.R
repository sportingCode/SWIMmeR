SwitchMining <- function(){
  
  ########################################
  # input parameters
  
  res_filtered <- get(load(output_file$filename_dataFiltered))
  df_stat <- res_filtered$df_stat
  
  if(input_parameter$miRNA == "yes"){
    res_filtered_miRNA <- get(load(output_file$filename_dataFiltered_miRNA))
    df_stat_miRNA <- res_filtered_miRNA$df_stat
    df_stat <- rbind(df_stat,df_stat_miRNA)
  }
  
  output_file_CartographyNetwork <- output_file$filename_CartographyNetwork 
  output_file_CartographyNetwork_R <- output_file$filename_CartographyNetwork_R 
  output_file_attribute <- output_file$filename_attribute
  output_file_nn_pos_switch <- output_file$filename_nn_pos_switch
  output_file_nn_neg_switch <- output_file$filename_nn_neg_switch
  output_file_corr_nn_pos_switch <- output_file$filename_corr_nn_pos_switch
  output_file_corr_nn_neg_switch <- output_file$filename_corr_nn_neg_switch
  output_file_cluster_nn_pos_switch <- output_file$filename_cluster_nn_pos_switch
  output_file_cluster_nn_neg_switch <- output_file$filename_cluster_nn_neg_switch
  ########################################
  
  idx <- network$idx
  w_adj <- network$w_adj
  network <- network$network
  
  APCC <- computeAPCC(w_adj)
  
  res_deg <- computeDegree(w_adj,idx)
  
  hub_class <- getHubClassification(APCC,res_deg$deg)
  
  cartography <- buildCartography(df_stat,idx,res_deg,APCC,hub_class,network,output_file_attribute,
                            output_file_CartographyNetwork,output_file_CartographyNetwork_R)
  
  attribute_switch <- getSwitch(cartography$attribute,output_file)
  
  getNearestNeighbor(cartography,attribute_switch,w_adj,idx,"pos",output_file_nn_pos_switch,
                     output_file_corr_nn_pos_switch,output_file_cluster_nn_pos_switch)

  getNearestNeighbor(cartography,attribute_switch,w_adj,idx,"neg",output_file_nn_neg_switch,
                        output_file_corr_nn_neg_switch,output_file_cluster_nn_neg_switch)
  
  makeFigureSwitch(cartography,attribute_switch,output_file)
    
  res <- list(attribute = cartography$attribute,
              num_node = cartography$num_node,
              num_edge = cartography$num_edge,
              attribute_switch = attribute_switch)
  
  return(res)
  
}