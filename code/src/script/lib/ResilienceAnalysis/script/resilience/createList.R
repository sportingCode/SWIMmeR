createList <- function(node,degree,attribute,switch_list,N){
  
  ind_nsh <- which( !(attribute$node %in% switch_list) & !(attribute$Hub_classification == "no hub") )
  no_switch_hub_list <- attribute$node[ind_nsh]
  no_switch_hub_list <- orderList(no_switch_hub_list,degree,N)
  
  ind_h <- which(!(attribute$Hub_classification == "no hub"))
  hub_list <- attribute$node[ind_h]
  hub_list <- orderList(hub_list,degree,N)
  
  ind_d <- which(attribute$Hub_classification == "DATE")
  date_list <- attribute$node[ind_d]
  date_list <- orderList(date_list,degree,N)
  
  ind_p <- which(attribute$Hub_classification == "PARTY")
  party_list <- attribute$node[ind_p]
  party_list <- orderList(party_list,degree,N)
  
  ind_f <- which(attribute$Hub_classification == "FIGHT CLUB")
  fight_club_list <- attribute$node[ind_f]
  fight_club_list <- orderList(fight_club_list,degree,N)
  
  switch_list <- orderList(switch_list,degree,N)
  
  random_list <- sample(node,N)
  
  res <- list(no_switch_hub_list = no_switch_hub_list,
              hub_list = hub_list,
              date_list = date_list,
              party_list = party_list,
              fight_club_list = fight_club_list,
              switch_list = switch_list,
              random_list = random_list)
  
  return(res)
  
}