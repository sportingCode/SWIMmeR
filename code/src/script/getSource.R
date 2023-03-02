getSource <- function(){
  
  # input
  source("src/script/input/config.R")
  source("src/script/input/inputFiles.R")
  
  # output
  source("src/script/output/outputDir.R")
  source("src/script/output/outputFiles.R")
  
  # statistics
  source("src/script/lib/ExploratoryDataAnalysis/ExploratoryDataAnalysis.R")
  source("src/script/lib/ExploratoryDataAnalysis/script/mainEDA.R")
  source("src/script/lib/ExploratoryDataAnalysis/script/dataConversion/getLogData.R")
  source("src/script/lib/ExploratoryDataAnalysis/script/dataConversion/computeStat.R")
  source("src/script/lib/ExploratoryDataAnalysis/script/dataProcessing/getPreprocessing.R")
  source("src/script/lib/ExploratoryDataAnalysis/script/dataProcessing/getFiltering.R")
  source("src/script/lib/ExploratoryDataAnalysis/script/dataProcessing/combineMatrices.R")
  source("src/script/lib/ExploratoryDataAnalysis/script/figure/makeFigure.R")
  source("src/script/lib/ExploratoryDataAnalysis/script/figure/getHistogram.R")
  source("src/script/lib/ExploratoryDataAnalysis/script/figure/getScatterPlot.R")
  source("src/script/lib/ExploratoryDataAnalysis/script/figure/getVolcanoPlot.R")
  source("src/script/lib/ExploratoryDataAnalysis/script/figure/getHeatmap.R")
  source("src/script/lib/ExploratoryDataAnalysis/script/figure/saveHeatmapPDF.R")
  
  # network
  source("src/script/lib/NetworkAnalysis/NetworkAnalysis.R")
  source("src/script/lib/NetworkAnalysis/script/network/computeCorrelation.R")
  source("src/script/lib/NetworkAnalysis/script/network/buildCorrelationNetwork.R")
  source("src/script/lib/NetworkAnalysis/script/network/checkNetworkIntegrity.R")
  source("src/script/lib/NetworkAnalysis/script/network/computeNetworkIntegrity.R")
  source("src/script/lib/NetworkAnalysis/script/network/createWeightedAdjMatrix.R")
  source("src/script/lib/NetworkAnalysis/script/clustering/getClustering.R")
  source("src/script/lib/NetworkAnalysis/script/clustering/computeClusterConnectivity.R")
  source("src/script/lib/NetworkAnalysis/script/clustering/createClusterMatrix.R")
  source("src/script/lib/NetworkAnalysis/script/figure/getScreePlot.R")
  source("src/script/lib/NetworkAnalysis/script/figure/getNetworkIntegrityPlot.R")
  
  # switch
  source("src/script/lib/SwitchMining/SwitchMining.R")
  source("src/script/lib/SwitchMining/script/cartography/computeDegree.R")
  source("src/script/lib/SwitchMining/script/cartography/computePz.R")
  source("src/script/lib/SwitchMining/script/cartography/getNodeRole.R")
  source("src/script/lib/SwitchMining/script/cartography/buildCartography.R")
  source("src/script/lib/SwitchMining/script/switch/computeAPCC.R")
  source("src/script/lib/SwitchMining/script/switch/getHubClassification.R")
  source("src/script/lib/SwitchMining/script/switch/getSwitch.R")
  source("src/script/lib/SwitchMining/script/switch/getNearestNeighbor.R")
  source("src/script/lib/SwitchMining/script/figure/makeFigureSwitch.R")
  source("src/script/lib/SwitchMining/script/figure/getHeatCartography.R")
  source("src/script/lib/SwitchMining/script/figure/getAPCCdistribution.R")
  
  #removal node
  source("src/script/lib/ResilienceAnalysis/ResilienceAnalysis.R")
  source("src/script/lib/ResilienceAnalysis/script/resilience/createList.R")
  source("src/script/lib/ResilienceAnalysis/script/resilience/orderList.R")
  source("src/script/lib/ResilienceAnalysis/script/resilience/removeNode.R")
  source("src/script/lib/ResilienceAnalysis/script/resilience/computeConnectivity.R")
  source("src/script/lib/ResilienceAnalysis/script/figure/makeFigureResilience.R")
  source("src/script/lib/ResilienceAnalysis/script/figure/getResiliencePlot.R")
  
  # save input parameters
  source("src/script/lib/saveParameters.R")
  
  # save PDF file
  source("src/script/lib/savePDF.R")
  
}
