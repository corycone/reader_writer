library(xlsx)
library(ggplot2)
library(dplyr)
library(gridExtra)
library(tidyverse)
library(plotly)
library(extrafont)
#the below commented code is for importing the Google Font Roboto Condensed Light after it has been installed locally
#font_import #for first time run (take a long time to run)  
#loadfonts(device = "win") #for first time run




#load data
r_comp <- read.xlsx("data/all_reading.xlsx", sheetName = "all_reading")

#run data prep scripts (facets, theme, some math)
source("fritz_reading_prep.R")

#2015 Reading
p <- ggplot(r_years$`2015`, aes(x=day, y = minutes/60)) +
  geom_area(fill = fill_color) +
  scale_y_reverse() +
  facet_wrap(~facet, strip.position = "top") +
  labs(title = "2015",
       x = "Day of the Month", 
       y = "Hours") +
  g_theme + coord_cartesian(ylim=c(0, 3))

#2016 Reading  
p2 <- ggplot(r_years$`2016`, aes(x=day, y = minutes/60)) +
  geom_area(fill = fill_color) +
  scale_y_reverse() +
  facet_wrap(~facet, strip.position = "top") +
  labs(title = "2016", 
       x = "Day of the Month", 
       y = "Hours") +
  g_theme + coord_cartesian(ylim=c(0, 3))

#2017 Reading
p3 <- ggplot(r_years$`2017`, aes(x=day, y = minutes/60)) +
  geom_area(fill = fill_color) +
  scale_y_reverse() +
  facet_wrap(~facet, strip.position = "top") +
  labs(title = "2017", 
       x = "Day of the Month", 
       y = "Hours") +
  g_theme + coord_cartesian(ylim=c(0, 3))

#2018 Reading
p4 <- ggplot(r_years$`2018`, aes(x=day, y = minutes/60)) +
  geom_area(fill = fill_color) +
  scale_y_reverse() +
  facet_wrap(~facet, strip.position = "top") +
  labs(title = "2018", 
       x = "Day of the Month", 
       y = "Hours",
       caption = "Source: K. Edwin Fritz, www.fritzfiction.com
       Graphic: Cory Cone, dataviz.corycone.com") +
  g_theme + coord_cartesian(ylim=c(0, 3))

#Average reading by Weekday
p_avg <- ggplot(r_weekday_mean, aes(x = Weekday, y = `Avg. Minutes`)) +
  #scale_fill_brewer(palette = "Paired") +
  geom_bar(stat = "identity", fill = "#585858") +
  labs(title = "Average Minutes Read by Weekday | 2015 - 2018", 
       x = "Day of the Week", 
       y = "Average Minutes Read") +
  g_theme

#Average reading by Month
p_month_avg <- ggplot(r_month_mean, aes(x = Month, y = `Avg. Minutes`)) +
  #scale_fill_brewer(palette = "Paired") +
  geom_bar(stat = "identity", fill = fill_color) +
  #geom_area(fill = fill_color) +
  scale_y_reverse() +
  labs(title = "Average Minutes Read by Month | 2015 - 2018", 
       x = "Month", 
       y = "Average Minutes Read") +
  g_theme

#Empty plot for text
text = paste("Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
Nulla et sapien semper, hendrerit metus a, consequat est. Interdum et malesuada 
fames ac ante ipsum primis in faucibus. Nam imperdiet, neque in aliquam tempor, 
sem ante consectetur urna, eu hendrerit leo arcu sed mauris. Aenean blandit pretium facilisis. Suspendisse est sem, sagittis in malesuada in, 
aliquam vel nisl. In efficitur ex arcu, sed tempor libero malesuada ut. Etiam laoreet, velit at facilisis dapibus, velit arcu finibus justo, 
non consequat lorem quam et sapien. Maecenas vitae iaculis metus. Ut bibendum, justo non 
vehicula vulputate, nibh ligula maximus ante, in accumsan augue risus bibendum justo.\n")
title_plot <- ggplot(r_month_mean, aes(x = Month, y = `Avg. Minutes`)) +
  #scale_fill_brewer(palette = "Paired") +
  geom_blank() +
  annotate("text", x = 0, y = 55, size=4, label = text, adj=0, family = "Roboto Condensed Light") + 
  labs(title = "The Reading Habits
of Horror Writer
K. Edwin Fritz",
       subtitle = "Daily Hours of Reading, 2015 — 2018",
       x = "Month", 
       y = "Average Minutes Read") +
    g_theme_title

#how to read these plots, plot
example <- ggplot(july_2018, aes(x=day, y = minutes/60)) +
  geom_area(fill = fill_color) +
  scale_y_reverse() +
  facet_wrap(~facet, strip.position = "top") +
  labs(title = "Guide", 
       x = "Day of the Month", 
       y = "Hours") +
  scale_x_continuous(breaks = july_2018$day) +
  g_theme_example

#arrange all plots
final <- grid.arrange(title_plot, p, p2, p3, p4, animate(anim2, fps = 30, duration = 4), nrow = 6, ncol=1)

ggsave("inprogress.png", final , width = 12, height = 35, dpi = 300, limitsize = FALSE)

#p123 <- ggplotly(p2)
#p1234 <- ggplotly(p)

#subplot(p123, p1234)