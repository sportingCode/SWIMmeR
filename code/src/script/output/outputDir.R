outputDir <- function(path){
  
  ########################################
  dirFilter <- paste0(path,"/filtering/")
  if(!file.exists(dirFilter)){
    dir.create(dirFilter)
  }
  
  dirSwitch <- paste0(path,"/switch/")
  if(!file.exists(dirSwitch)){
    dir.create(dirSwitch)
  }
  ########################################
  # output filtering 
  
  dirTxtFilter <- paste0(dirFilter,"txtFile/")
  if(!file.exists(dirTxtFilter)){
    dir.create(dirTxtFilter)
  }
  
  dirFigureFilter <- paste0(dirFilter,"figure/")
  if(!file.exists(dirFigureFilter)){
    dir.create(dirFigureFilter)
  }
  
  dirRdataFilter <- paste0(dirFilter,"Rdata/")
  if(!file.exists(dirRdataFilter)){
    dir.create(dirRdataFilter)
  }
  ########################################
  # output switch
  
  dirTxtSwitch <- paste0(dirSwitch,"txtFile/")
  if(!file.exists(dirTxtSwitch)){
    dir.create(dirTxtSwitch)
  }
  
  dirFigureSwitch <- paste0(dirSwitch,"figure/")
  if(!file.exists(dirFigureSwitch)){
    dir.create(dirFigureSwitch)
  }
  
  dirRdataSwitch <- paste0(dirSwitch,"Rdata/")
  if(!file.exists(dirRdataSwitch)){
    dir.create(dirRdataSwitch)
  }
  
  ########################################
  
  output_directory <- list(dirTxtFilter = dirTxtFilter,
                           dirFigureFilter = dirFigureFilter,
                           dirRdataFilter = dirRdataFilter,
                           dirTxtSwitch = dirTxtSwitch,
                           dirFigureSwitch = dirFigureSwitch,
                           dirRdataSwitch = dirRdataSwitch)
  
  return(output_directory)
  
}
