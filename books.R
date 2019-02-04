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
joined_2016 <- r_years$`2016` %>% left_join(books)
joined_2016_points <- r_years$`2016` %>% inner_join(books)
joined_2017 <- r_years$`2017` %>% left_join(books)
joined_2017_points <- r_years$`2017` %>% inner_join(books)
joined_2018 <- r_years$`2018` %>% left_join(books)
joined_2018_points <- r_years$`2018` %>% inner_join(books)


#plot for plotly
book = joined_2015_points$Title.and.Author

pplotly1 <- ggplot(joined_2015, aes(x=day, y = minutes/60, label = Title.and.Author, label2 = Date)) + #, book = Title.and.Author, date = Date, grade = Grade)) +
  geom_density(data=joined_2015, stat = "identity", fill = fill_color, color = "#660000", aes(y=minutes/60)) +
  geom_point(data=joined_2015_points, size = 3, alpha = .5, aes(x=day, y = minutes/60, color = joined_2015_points$Grade)) +
  scale_color_brewer(palette = "Paired") +
  scale_y_reverse() +
  facet_wrap(~facet, strip.position = "top") +
  labs(title = "Books Read & Graded by K. Edwin Fritz | 2015",
       x = "Day of the Month", 
       y = "Hours",
       caption = "Source: K. Edwin Fritz, www.fritzfiction.com
       Graphic: Cory Cone, dataviz.corycone.com") +
  g_theme_plotly


pplotly2 <- ggplot(joined_2016, aes(x=day, y = minutes/60, label = Title.and.Author, label2 = Date)) + #, book = Title.and.Author, date = Date, grade = Grade)) +
  geom_density(data=joined_2016, stat = "identity", fill = fill_color, color = "#660000", aes(y=minutes/60)) +
  geom_point(data=joined_2016_points, size = 3, alpha = .5, aes(x=day, y = minutes/60, color = joined_2016_points$Grade)) +
  scale_color_brewer(palette = "Paired") +
  scale_y_reverse() +
  facet_wrap(~facet, strip.position = "top") +
  labs(title = "Books Read & Graded by K. Edwin Fritz | 2016",
       x = "Day of the Month", 
       y = "Hours",
       caption = "Source: K. Edwin Fritz, www.fritzfiction.com
       Graphic: Cory Cone, dataviz.corycone.com") +
  g_theme_plotly


pplotly3 <- ggplot(joined_2017, aes(x=day, y = minutes/60, label = Title.and.Author, label2 = Date)) + #, book = Title.and.Author, date = Date, grade = Grade)) +
  geom_density(data=joined_2017, stat = "identity", fill = fill_color, color = "#660000", aes(y=minutes/60)) +
  geom_point(data=joined_2017_points, size = 3, alpha = .5, aes(x=day, y = minutes/60, color = joined_2017_points$Grade)) +
  scale_color_brewer(palette = "Paired") +
  scale_y_reverse() +
  facet_wrap(~facet, strip.position = "top") +
  labs(title = "Books Read & Graded by K. Edwin Fritz | 2017",
       x = "Day of the Month", 
       y = "Hours",
       caption = "Source: K. Edwin Fritz, www.fritzfiction.com
       Graphic: Cory Cone, dataviz.corycone.com") +
  g_theme_plotly


pplotly4 <- ggplot(joined_2018, aes(x=day, y = minutes/60, label = Title.and.Author, label2 = Date)) + #, book = Title.and.Author, date = Date, grade = Grade)) +
  geom_density(data=joined_2018, stat = "identity", fill = fill_color, color = "#660000", aes(y=minutes/60)) +
  geom_point(data=joined_2018_points, size = 3, alpha = .5, aes(x=day, y = minutes/60, color = joined_2018_points$Grade)) +
  scale_color_brewer(palette = "Paired") +
  scale_y_reverse() +
  facet_wrap(~facet, strip.position = "top") +
  labs(title = "Books Read & Graded by K. Edwin Fritz | 2018",
       x = "Day of the Month", 
       y = "Hours",
       caption = "Source: K. Edwin Fritz, www.fritzfiction.com
       Graphic: Cory Cone, dataviz.corycone.com") +
  g_theme_plotly


p_fritz_2015 <- ggplotly(pplotly1, tooltip = (c("label", "label2", "label3")))
p_fritz_2016 <- ggplotly(pplotly2, tooltip = (c("label", "label2", "label3")))
p_fritz_2017 <- ggplotly(pplotly3, tooltip = (c("label", "label2", "label3")))
p_fritz_2018 <- ggplotly(pplotly4, tooltip = (c("label", "label2", "label3")))

p_fritz_2015
p_fritz_2016
p_fritz_2017
p_fritz_2018

#send to plotly
api_create(p_fritz_2018, filename = "books-read-fritz-2018")
api_create(p_fritz_2017, filename = "books-read-fritz-2017")
api_create(p_fritz_2016, filename = "books-read-fritz-2016")
api_create(p_fritz_2015, filename = "books-read-fritz-2015")