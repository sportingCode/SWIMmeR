savePDF <- function(myplot,output_file){
  
  pdf(output_file,width=6, height=5)
  print(myplot)
  dev.off()
  
}