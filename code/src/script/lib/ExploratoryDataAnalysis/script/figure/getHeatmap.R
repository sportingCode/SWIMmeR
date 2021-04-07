getHeatmap <- function(data.Filtered,output_file,title){
  
  ########################################
  # input parameters
  
  data <- data.Filtered$data
  control <- colnames(data.Filtered$data_control)
  case <- colnames(data.Filtered$data_case)
  ########################################
  
  samples <- ifelse( (colnames(data) %in% control), "control", "case")
  annotation <- data.frame(SampleType = samples)
  rownames(annotation) <- colnames(data)
  
  annotation_colors <- list(SampleType = c(case = "red", control = "green"))
  
  colorbar <- colorRampPalette(colors = c("blue","blue1","blue2","black","yellow2","yellow1","yellow"))(100)
  
  out <- pheatmap(data, scale = "row",
                  border_color = NA,
                  clustering_distance_rows = "correlation",
                  clustering_distance_cols = "correlation",
                  clustering_method = "complete",
                  cluster_cols = T,
                  cluster_rows = T,
                  annotation_col = annotation,
                  annotation_colors = annotation_colors,
                  color = colorbar,
                  show_rownames = F,
                  show_colnames = F,
                  main = title
                  #width = 10, 
                  #height = 10,
                  #treeheight_row = 30,
                  #fontsize = 10,
                  #cellwidth = 0.3, 
                  #cellheight = 0.3 
  )
  
  saveHeatmapPDF(out,output_file)

}

