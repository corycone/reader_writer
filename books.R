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

#left join book info
joined_2015 <- r_years$`2015` %>% left_join(books)


#plot for plotly

pplotly1 <- ggplot(joined_2015, aes(x=day, y = minutes/60)) +
  geom_density(stat = "identity", fill = fill_color, color = "#660000") +
  scale_y_reverse() +
  facet_wrap(~facet, strip.position = "top") +
  labs(title = "2015", 
       x = "Day of the Month", 
       y = "Hours") +
  g_theme

ggplotly(pplotly1)
# initital plotly
mytext=paste("Date = ", joined_2015$Date, 
             "Finished Reading = ", joined_2015$Title.and.Author,
             "Grade = ", joined_2015$Grade)    
plotly_2015=plotly_build(pplotly1)   
style( plotly_2015, text=mytext, hoverinfo = "text")