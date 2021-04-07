# Copyright (C) 2020 Paola Paci
#
# This file is part of SWIMmeR
#
# SWIMmeR is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
# 
# SWIMmeR is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU Affero General Public License for more details.
# 
# You should have received a copy of the GNU Affero General Public License
# along with SWIMmeR. If not, see <http://www.gnu.org/licenses/>.

rm(list=ls())

options(stringsAsFactors = F)

setwd("~/SWIMmeR/code")
######################################
source("src/script/getLibrary.R")
source("src/script/getSource.R")
######################################
getLibrary()
getSource()
input_parameter <- config()
input_file <- inputFiles()
output_file <- outputFiles()
######################################

data <- ExploratoryDataAnalysis()

network <- NetworkAnalysis(data, checkNetIntegrity = T, screePlot = T)

switch <- SwitchMining()

saveParameters()

if(input_parameter$removal_node == "yes") resilience <- ResilienceAnalysis()
