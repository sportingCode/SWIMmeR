getLibrary <- function(){
  
  packages_installed <- installed.packages()
  
  ######################################
  # Installing packages from CRAN
  
  if(!"devtools" %in% packages_installed){install.packages('devtools')}
  
  packages_CRAN <- c("data.table",
                     "ggplot2",
                     "pheatmap",
                     "Hmisc",          # rcorr
                     "igraph",
                     "factoextra",     # Elbow method
                     "NbClust",        # Elbow method
                     "RColorBrewer",   # Heat Cartography color
                     "stringi",        # stri_list2matrix
                     "gridExtra"       # save multiple plot (grid.arrange)
                      )
  
  packages_to_install_CRAN <- setdiff(packages_CRAN,packages_installed)
  
  if( length(packages_to_install_CRAN) > 0 ){
    devtools::install_cran(packages_to_install_CRAN, upgrade = 'never')
  }
  
  # Loading installed packages
  
  invisible(sapply(packages_CRAN,require,character.only = TRUE))
  ######################################
}


