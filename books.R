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

#run data prep scripts (facets, theme, some math)
source("fritz_reading_prep.R")

#left join book info
joined_2015 <- r_years$`2015` %>% left_join(books)
joined_2015_points <- r_years$`2015` %>% inner_join(books)


#plot for plotly
book = joined_2015_points$Title.and.Author

pplotly1 <- ggplot(joined_2015, aes(x=day, y = minutes/60, label = Title.and.Author, label2 = Date)) + #, book = Title.and.Author, date = Date, grade = Grade)) +
  geom_density(data=joined_2015, stat = "identity", fill = fill_color, color = "#660000", aes(y=minutes/60)) +
  geom_point(data=joined_2015_points, size = 3, alpha = .8, aes(x=day, y = minutes/60, color = joined_2015_points$Grade)) +
  scale_color_brewer(palette = "Set2") +
  #geom_point(data=joined_2015, aes(alpha = 1), color = "skyblue") +
  scale_y_reverse() +
  facet_wrap(~facet, strip.position = "top") +
  labs(title = "2015",
       x = "Day of the Month", 
       y = "Hours") +
       caption = "Source: K. Edwin Fritz, www.fritzfiction.com
       Graphic: Cory Cone, dataviz.corycone.com" +
  g_theme_plotly

ggplotly(pplotly1, tooltip = (c("label", "label2", "label3")))

