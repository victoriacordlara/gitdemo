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
  
# Required Packages
library(dplyr)    # data wrangling
library(ggplot2)  # graphics

# Exporting data tables
dat=read.csv("gitdemo/data/nba2018-players.csv")

warriors=filter(dat,dat$team=="GSW") #creating data
write.csv(warriors, 'gitdemo/data/warriors.csv', row.names = FALSE) #making csv

# Exporting R output
sink(file = 'gitdemo/output/summary-height-weight.txt') 
summary(dat[ ,c('height', 'weight')])
sink() #all of this will divert output to specified file

sink(file = 'gitdemo/output/data-structure.txt') 
str(dat)
sink() 

sink(file = 'gitdemo/output/summary-warriors.txt') 
summary(warriors)
sink()

lakers=filter(dat,dat$team=="LAL")
sink(file = 'gitdemo/output/summary-lakers.txt') 
summary(lakers)
sink()

# Exporting graphs
png(filename = "gitdemo/images/scatterplot-height-weight.png")
plot(dat$height, dat$weight, pch = 20, 
     xlab = 'Height', ylab = 'Height')
dev.off() # saving a scatterplot in png format

jpeg(filename = "gitdemo/images/histogram-age.jpeg", width = 600, height = 400)
hist(dat$age, xlab = "Age",main = "Histogram of Age")
dev.off()

png(filename = "gitdemo/images/scatterplot2-height-weight.png", 
    pointsize = 20)
plot(dat$height, dat$weight, pch = 20, 
     xlab = 'Height', ylab = 'Weight')
dev.off()

ggplot(dat, aes(x= height, y= weight)) + geom_point() + facet_grid(position ~ .)
ggsave(filename="gitdemo/images/height_weight_by_position.pdf")
