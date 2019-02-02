#load libraries

library(xlsx)
library(ggplot2)
library(dplyr)
library(gridExtra)
library(tidyverse)
library(extrafont)
library(gganimate)
library(cairoDevice)
library(plotly)

#the below commented code is for importing the Google Font Roboto Condensed Light after it has been installed locally
#font_import #for first time run (take a long time to run)  
#loadfonts(device = "win") #for first time run


#load data
books <- read.xlsx("data/books.xlsx", sheetName = "Sheet1")
#test_2015_merge <- r_comp
#merged <- merge(books, test_2015_merge, by = "Date", all = TRUE)
#merged_years<- split(merge, as.factor(merge$Year))

#plot for plotly

pplotly1 <- ggplot(r_years$`2015`, aes(x=day, y = minutes/60)) +
  geom_density(stat = "identity", fill = fill_color, color = "#660000") +
  scale_y_reverse() +
  facet_wrap(~facet, strip.position = "top") +
  labs(title = "2015", 
       x = "Day of the Month", 
       y = "Hours") +
  g_theme

ggplotly(pplotly1)
# initital plotly
mytext=paste("Date = ", r_years$`2015`$Date)    
pp=plotly_build(pplotly1)   
style( pplotly1, text=mytext, hoverinfo = "text")