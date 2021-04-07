ResilienceAnalysis <- function(){
  
  ########################################
  # input parameters
  
  network <- get(load(output_file$filename_CorrelationNetwork_R ))
  
  attribute <- read.table(output_file$filename_attribute, 
                          header = T, sep = '\t', check.names = F, quote = "")
  
  switch_list <- read.table(output_file$filename_switch, 
                            header = F, sep = '\t', check.names = F, quote = "")
  switch_list <- switch_list$V1
  
  output_file_removalNoSwitchHubs <- output_file$filename_removalNoSwitchHubs
  output_file_removalHubs <- output_file$filename_removalHubs
  output_file_removalDateHubs <- output_file$filename_removalDateHubs
  output_file_removalPartyHubs <- output_file$filename_removalPartyHubs
  output_file_removalFightClub <- output_file$filename_removalFightClub
  output_file_removalSwitch <- output_file$filename_removalSwitch
  output_file_removalRandomNodes <- output_file$filename_removalRandomNodes
  output_file_removalNodes <- output_file$filename_removalNodes
  ########################################
  
  net_info <- computeConnectivity(network)
  
  node <- net_info$node
  degree <- net_info$degree
  mean_sp <- net_info$mean_sp
  
  N <- length(switch_list)
  M <- length(node)
  
  list <- createList(node,degree,attribute,switch_list,N)
  
  no_switch_hub_removal <- removeNode(list$no_switch_hub_list,network,mean_sp,N,M,output_file_removalNoSwitchHubs)
  
  hub_removal <- removeNode(list$hub_list,network,mean_sp,N,M,output_file_removalHubs)
  
  date_removal <- removeNode(list$date_list,network,mean_sp,N,M,output_file_removalDateHubs)
  
  party_removal <- removeNode(list$party_list,network,mean_sp,N,M,output_file_removalPartyHubs)
  
  fight_club_removal <- removeNode(list$fight_club_list,network,mean_sp,N,M,output_file_removalFightClub)
  
  switch_removal <- removeNode(list$switch_list,network,mean_sp,N,M,output_file_removalSwitch)
  
  random_removal <- removeNode(list$random_list,network,mean_sp,N,M,output_file_removalRandomNodes)
  
  res <- list(no_switch_hub_removal = no_switch_hub_removal,
              hub_removal = hub_removal,
              date_removal = date_removal,
              party_removal = party_removal,
              fight_club_removal = fight_club_removal,
              switch_removal = switch_removal,
              random_removal = random_removal)
  
  makeFigureResilience(res,output_file_removalNodes)
  
  return(res)
  
}

