makeFigureResilience <- function(resilience,output_file){
  
  ########################################
  # input parameters
  
  no_switch_hub_removal <- resilience$no_switch_hub_removal
  hub_removal <- resilience$hub_removal
  date_removal <- resilience$date_removal
  party_removal <- resilience$party_removal
  fight_club_removal <- resilience$fight_club_removal
  switch_removal <- resilience$switch_removal
  random_removal <- resilience$random_removal
  ########################################
  
  L <- min(c(nrow(no_switch_hub_removal),nrow(hub_removal),nrow(date_removal),
             nrow(party_removal),nrow(fight_club_removal),
             nrow(switch_removal),nrow(random_removal)))
  
  df <- data.frame(frac = random_removal$frac[1:L],
                   no_switch_hub = no_switch_hub_removal$mean_sp[1:L],
                   hub = hub_removal$mean_sp[1:L],
                   date = date_removal$mean_sp[1:L],
                   party = party_removal$mean_sp[1:L],
                   fight_club = fight_club_removal$mean_sp[1:L],
                   switch = switch_removal$mean_sp[1:L],
                   random = random_removal$mean_sp[1:L])
  
  getResiliencePlot(df,output_file)
  
}