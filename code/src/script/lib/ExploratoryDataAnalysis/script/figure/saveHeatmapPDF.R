saveHeatmapPDF <- function(x,filename){
  
  stopifnot(!missing(x))
  stopifnot(!missing(filename))
  
  pdf(filename)
  
  grid::grid.newpage()
  grid::grid.draw(x$gtable)
  
  dev.off()
  
}