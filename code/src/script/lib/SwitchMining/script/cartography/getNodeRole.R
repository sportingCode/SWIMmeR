getNodeRole <- function(y,z,P){
  
  hub <- vector(mode = "character", length = length(y))
  type <- vector(mode = "character", length = length(y))
  region <- vector(mode = "character", length = length(y))
  
  hub[z < 2.5] = 'non local hub'
  hub[z >= 2.5] = 'local hub'
  
  region[z < 2.5 & P <= 0.04] <- 'R1'
  region[z < 2.5 & P > 0.04  & P <= 0.625] <- 'R2'
  region[z < 2.5 & P > 0.625 & P <= 0.8] <- 'R3'
  region[z < 2.5 & P > 0.8] <- 'R4'
  region[z >= 2.5 & P <= 0.3] <- 'R5'
  region[z >= 2.5 & P > 0.3  && P <= 0.75] <- 'R6'
  region[z >= 2.5 & P > 0.75] <- 'R7'
  
  type[z < 2.5 & P <= 0.04] <- 'Ultra-peripheral nodes'
  type[z < 2.5 & P > 0.04  & P <= 0.625] <- 'Peripheral nodes'
  type[z < 2.5 & P > 0.625 & P <= 0.8] <- 'Non-hub connectors'
  type[z < 2.5 & P > 0.8] <- 'Non-hub kinless nodes';
  type[z >= 2.5 & P <= 0.3] <- 'Provincial hubs'
  type[z >= 2.5 & P > 0.3  && P <= 0.75] <- 'Connector hubs'
  type[z >= 2.5 & P > 0.75] <- 'Kinless hubs'
  
  res <- list(hub = hub, region = region, type = type)
  
  return(res)
  
}