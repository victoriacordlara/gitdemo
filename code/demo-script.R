-------------------------------------------------------------------------------
# Title: Statistical Analysis
# Description: 
#     This script computes descriptive and analytical statistics, as well as 
#     various data visualizations, following the outline for lab 05.
# Input(s): data from file 'nba2018-players.csv'
# Output(s): summary data files and graphs
# Author(s): Victoria Cordovez Lara
# Date: 10-03-2019
-------------------------------------------------------------------------------
  
  # packages
  library(dplyr)    # data wrangling
library(ggplot2)  # graphics

dat=read.csv("gitdemo/data/nba2018-players.csv")

warriors=filter(dat,dat$team=="GSW")
write.csv(warriors, 'gitdemo/data/warriors.csv', row.names = FALSE)

