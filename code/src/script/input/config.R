config <- function(){
  
  # for executing SWIMmer launch:
  # source('~/SWIMmeR/code/src/main.R')
  
  #################################
  project <- "TCGA"
  dataset <- "brca"
  miRNA <- "yes"
  
  path <- paste0("project/",project,"/dataset/",dataset)
  #################################
  # input files
  
  filename_data <- paste0(path,"/matrix/matrice__brca_RNASeq.txt")
  filename_CTRL <- paste0(path,"/list/Lista__RNASeq_Normal__brca__4wayData.txt")
  filename_CASE <- paste0(path,"/list/Lista__RNASeq_Tumor__brca__4wayData.txt")
  
  if(miRNA == "yes"){
    filename_data_miRNA <- paste0(path,"/matrix/matrice__brca_miRNASeq.txt")
    filename_CTRL_miRNA <- paste0(path,"/list/Lista__miRNASeq_Normal__brca__4wayData.txt")
    filename_CASE_miRNA <- paste0(path,"/list/Lista__miRNASeq_Tumor__brca__4wayData.txt")
  }
  #################################
  # input parameters
  
  paired_ttest <- T            # a logical value indicating whether you want a paired t-test
  correction_method <- "fdr"   # method for multiple testing correction
  
  threshold_prc_iqr <- 0.11
  threshold_perc_zeros <- 75
  threshold_fc <- 3.4
  threshold_pval_adj <- 0.05
  
  if(miRNA == "yes"){
    threshold_prc_iqr_miRNA <- 0.53
    threshold_perc_zeros_miRNA <- 75
    threshold_fc_miRNA <- 3.4
    threshold_pval_adj_miRNA <- 0.05
  }
  
  type_correlation <- "pearson"
  threshold_prc_corr <- 0.8
  threshold_pval_adj_corr <- 0.05
  min_rho <- 0.1
  max_rho <- 0.9
  step_rho <- 0.05
  
  num_clusters <- 3         # set the number of clusters for k-means
  iter_max <- 100           # set the maximum number of iterations allowed
  num_repeats <- 5          # set the number of times to repeat the clustering (Replicates)
  
  removal_node <- "no"
  #################################
  
  input_parameter <- list(path = path,
                          project = project,
                          dataset = dataset,
                          miRNA = miRNA,
                          filename_data = filename_data,
                          filename_CTRL = filename_CTRL,
                          filename_CASE = filename_CASE,
                          paired_ttest = paired_ttest,
                          correction_method = correction_method,
                          threshold_prc_iqr = threshold_prc_iqr,
                          threshold_perc_zeros = threshold_perc_zeros,
                          threshold_fc = threshold_fc,
                          threshold_pval_adj = threshold_pval_adj,
                          type_correlation = type_correlation,
                          threshold_prc_corr = threshold_prc_corr, 
                          threshold_pval_adj_corr = threshold_pval_adj_corr,
                          min_rho = min_rho,
                          max_rho = max_rho,
                          step_rho = step_rho,
                          num_clusters = num_clusters,
                          iter_max = iter_max,
                          num_repeats = num_repeats,
                          removal_node = removal_node)
  
  if(miRNA == "yes"){
    
    input_parameter_miRNA <- list(filename_data_miRNA = filename_data_miRNA,
                                  filename_CTRL_miRNA = filename_CTRL_miRNA,
                                  filename_CASE_miRNA = filename_CASE_miRNA,
                                  threshold_prc_iqr_miRNA = threshold_prc_iqr_miRNA,
                                  threshold_perc_zeros_miRNA = threshold_perc_zeros_miRNA,
                                  threshold_fc_miRNA = threshold_fc_miRNA,
                                  threshold_pval_adj_miRNA = threshold_pval_adj_miRNA)
    
    input_parameter <- c(input_parameter,input_parameter_miRNA)
    
  }
  
  return(input_parameter)
  
}