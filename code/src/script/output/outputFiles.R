outputFiles <- function(){
  
  ########################################
  # input parameters
  
  path <- input_parameter$path
  miRNA <- input_parameter$miRNA
  removal_node <- input_parameter$removal_node
  
  output_dir <- outputDir(path)
  ########################################
  # output directories
  
  dirTxtFilter <- output_dir$dirTxtFilter
  dirFigureFilter <- output_dir$dirFigureFilter
  dirRdataFilter <- output_dir$dirRdataFilter
  dirTxtSwitch <- output_dir$dirTxtSwitch
  dirFigureSwitch <- output_dir$dirFigureSwitch
  dirRdataSwitch <- output_dir$dirRdataSwitch
  ########################################
  # output summary file
  
  filename_parameters <- paste0(path,"/parameter.RData")
  ########################################
  # output filtering txtFile
  
  filename_stat_dataORIG <- paste0(dirTxtFilter,"stat_dataORIG.txt")
  filename_stat_dataFiltered <- paste0(dirTxtFilter,"stat_dataFiltered.txt")
  
  if(miRNA == "yes"){
    filename_stat_dataORIG_miRNA <- paste0(dirTxtFilter,"stat_dataORIG_miRNA.txt")
    filename_stat_dataFiltered_miRNA <- paste0(dirTxtFilter,"stat_dataFiltered_miRNA.txt")
  }
  ########################################
  # output filtering figure
  
  filename_VolcanoPlot <- paste0(dirFigureFilter,"VolcanoPlot.pdf")
  filename_heatmap_DE <- paste0(dirFigureFilter,"heatmap_DE.pdf")
  
  if(miRNA == "yes"){
    filename_VolcanoPlot_miRNA <- paste0(dirFigureFilter,"VolcanoPlot_miRNA.pdf")
    filename_heatmap_DE_miRNA <- paste0(dirFigureFilter,"heatmap_DE_miRNA.pdf")
  }
  ########################################
  # output filtering Rdata
  
  filename_dataFiltered <- paste0(dirRdataFilter,"dataFiltered.RData")
  
  if(miRNA == "yes"){
    filename_dataFiltered_miRNA <- paste0(dirRdataFilter,"dataFiltered_miRNA.RData")
    filename_dataCombined <- paste0(dirRdataFilter,"dataCombined.RData")
  }
  ########################################
  # output switch txtFile
  
  filename_CorrelationNetwork <- paste0(dirTxtSwitch,"CorrelationNetwork.txt")
  filename_idx <- paste0(dirTxtSwitch,"idx.txt")
  filename_CartographyNetwork <- paste0(dirTxtSwitch,"CartographyNetwork.txt")
  filename_attribute <- paste0(dirTxtSwitch,"attribute.txt")
  filename_switch <- paste0(dirTxtSwitch,"switch.txt")
  filename_attribute_switch <- paste0(dirTxtSwitch,"attribute_switch.txt")
  filename_nn_neg_switch <- paste0(dirTxtSwitch,"nn_neg_switch.txt")
  filename_nn_pos_switch <- paste0(dirTxtSwitch,"nn_pos_switch.txt")
  filename_cluster_nn_neg_switch <- paste0(dirTxtSwitch,"cluster_nn_neg_switch.txt")
  filename_cluster_nn_pos_switch <- paste0(dirTxtSwitch,"cluster_nn_pos_switch.txt")
  filename_corr_nn_neg_switch <- paste0(dirTxtSwitch,"corr_nn_neg_switch.txt")
  filename_corr_nn_pos_switch <- paste0(dirTxtSwitch,"corr_nn_pos_switch.txt")
  ########################################
  # output switch figure
  
  filename_connectedComponent <- paste0(dirFigureSwitch,"connectedComponent.pdf")
  filename_APCC_distribution <- paste0(dirFigureSwitch,"APCC_distribution.pdf")
  filename_HeatCartography <- paste0(dirFigureSwitch,"HeatCartography.pdf")
  filename_heatmap_switch <- paste0(dirFigureSwitch,"heatmap_switch.pdf")
  
  if(miRNA == "yes") filename_heatmap_switch_miRNA <- paste0(dirFigureSwitch,"heatmap_switch_miRNA.pdf")
  
  if(removal_node == "yes") filename_removalNodes <- paste0(dirFigureSwitch,"removalNodes.pdf")
  ########################################
  # output switch Rdata
  
  filename_weighted_adjMatrix <- paste0(dirRdataSwitch,"weighted_adjMatrix.RData")
  filename_CorrelationNetwork_R <- paste0(dirRdataSwitch,"CorrelationNetwork.RData")
  filename_CartographyNetwork_R <- paste0(dirRdataSwitch,"CartographyNetwork.RData")
  
  if(removal_node == "yes"){
    filename_removalNoSwitchHubs <- paste0(dirRdataSwitch,"removalNoSwitchHubs.RData")
    filename_removalHubs <- paste0(dirRdataSwitch,"removalHubs.RData")
    filename_removalDateHubs <- paste0(dirRdataSwitch,"removalDateHubs.RData")
    filename_removalPartyHubs <- paste0(dirRdataSwitch,"removalPartyHubs.RData")
    filename_removalFightClub <- paste0(dirRdataSwitch,"removalFightClub.RData")
    filename_removalSwitch <- paste0(dirRdataSwitch,"removalSwitch.RData")
    filename_removalRandomNodes <- paste0(dirRdataSwitch,"removalRandomNodes.RData")
  }
  ########################################
  
  output_file <- list(filename_parameters = filename_parameters,
                      filename_stat_dataORIG = filename_stat_dataORIG,
                      filename_stat_dataFiltered = filename_stat_dataFiltered,
                      filename_dataFiltered = filename_dataFiltered,
                      filename_VolcanoPlot = filename_VolcanoPlot,
                      filename_heatmap_DE = filename_heatmap_DE,
                      filename_connectedComponent = filename_connectedComponent,
                      filename_CorrelationNetwork = filename_CorrelationNetwork, 
                      filename_CorrelationNetwork_R = filename_CorrelationNetwork_R,
                      filename_weighted_adjMatrix = filename_weighted_adjMatrix,
                      filename_idx = filename_idx, 
                      filename_CartographyNetwork = filename_CartographyNetwork, 
                      filename_CartographyNetwork_R = filename_CartographyNetwork_R,
                      filename_APCC_distribution = filename_APCC_distribution,
                      filename_HeatCartography = filename_HeatCartography, 
                      filename_attribute = filename_attribute, 
                      filename_switch = filename_switch, 
                      filename_heatmap_switch = filename_heatmap_switch,
                      filename_attribute_switch = filename_attribute_switch,
                      filename_nn_neg_switch = filename_nn_neg_switch,
                      filename_nn_pos_switch = filename_nn_pos_switch,
                      filename_cluster_nn_neg_switch = filename_cluster_nn_neg_switch, 
                      filename_cluster_nn_pos_switch = filename_cluster_nn_pos_switch, 
                      filename_corr_nn_neg_switch = filename_corr_nn_neg_switch,
                      filename_corr_nn_pos_switch = filename_corr_nn_pos_switch)
  
  if(miRNA == "yes"){
    
    output_file_miRNA <- list(filename_stat_dataORIG_miRNA = filename_stat_dataORIG_miRNA,
                              filename_stat_dataFiltered_miRNA = filename_stat_dataFiltered_miRNA,
                              filename_dataFiltered_miRNA = filename_dataFiltered_miRNA,
                              filename_dataCombined = filename_dataCombined,
                              filename_VolcanoPlot_miRNA = filename_VolcanoPlot_miRNA,
                              filename_heatmap_DE_miRNA = filename_heatmap_DE_miRNA,
                              filename_heatmap_switch_miRNA = filename_heatmap_switch_miRNA)
    
    output_file <- c(output_file,output_file_miRNA) 
    
  }
  
  if(removal_node == "yes") {
    
    output_file_removal <- list(filename_removalNoSwitchHubs = filename_removalNoSwitchHubs,
                                filename_removalHubs = filename_removalHubs, 
                                filename_removalDateHubs = filename_removalDateHubs,
                                filename_removalPartyHubs = filename_removalPartyHubs,
                                filename_removalFightClub = filename_removalFightClub,
                                filename_removalSwitch = filename_removalSwitch,
                                filename_removalRandomNodes = filename_removalRandomNodes,
                                filename_removalNodes = filename_removalNodes)
    
    output_file <- c(output_file,output_file_removal)
    
  }
  
  return(output_file)
  
}



