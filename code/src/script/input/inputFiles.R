inputFiles <- function(){
  
  ########################################
  # input parameters
  
  miRNA <- input_parameter$miRNA
  
  filename_data <- input_parameter$filename_data
  filename_CTRL <- input_parameter$filename_CTRL
  filename_CASE <- input_parameter$filename_CASE

  if(miRNA == "yes"){
    filename_data_miRNA <- input_parameter$filename_data_miRNA
    filename_CTRL_miRNA <- input_parameter$filename_CTRL_miRNA
    filename_CASE_miRNA <- input_parameter$filename_CASE_miRNA
  }
  ########################################
  # matrix
  data <- data.frame(fread(filename_data, header = T, sep = '\t', quote = "", na.strings = c(NULL,"-")), 
                     check.names = F, row.names = 1)
  data[is.na(data)] <- 0
  
  # list
  control <- read.table(filename_CTRL, header = F, sep = '\t', check.names = F, quote = "")
  case <- read.table(filename_CASE, header = F, sep = '\t', check.names = F, quote = "")
  
  control <- control$V1
  case <- case$V1
  
  data <- data[,c(control,case)]
  
  if(miRNA == "yes"){
    
    # matrix miRNA
    data_miRNA <- data.frame(fread(filename_data_miRNA, header = T, sep = '\t', quote = ""), check.names = F, row.names = 1)
    data[is.na(data)] <- 0
    
    # list miRNA
    control_miRNA <- read.table(filename_CTRL_miRNA, header = F, sep = '\t', check.names = F, quote = "")
    case_miRNA <- read.table(filename_CASE_miRNA, header = F, sep = '\t', check.names = F, quote = "")

    control_miRNA <- control_miRNA$V1
    case_miRNA <- case_miRNA$V1
    
    data_miRNA <- data_miRNA[,c(control_miRNA,case_miRNA)]
    
  }
  ########################################
  input_file <- list(data = data,
                     control = control,
                     case = case)
  
  if(miRNA == "yes"){
    input_file_miRNA <- list(data_miRNA = data_miRNA,
                             control_miRNA = control_miRNA,
                             case_miRNA = case_miRNA)
    
    input_file <- c(input_file,input_file_miRNA)
  }
  
  return(input_file)
  
}
