#load libraries

library(xlsx)
library(ggplot2)
library(dplyr)
library(gridExtra)
library(tidyverse)
library(extrafont)
library(gganimate)

#load data
r_comp <- read.xlsx("data/all_reading.xlsx", sheetName = "all_reading")

#run data prep scripts (facets, theme, some math)
source("fritz_reading_prep.R")

july_2018 <- subset(r_years$`2018`, r_years$`2018`$Month == "July")

#2018 animated
min_2018 <- ggplot(r_years$`2018`, aes(x=day, y = minutes/60)) +
  geom_area(fill = fill_color) +
  scale_y_reverse() +
  #facet_wrap(~facet, strip.position = "top") +
  #labs(title = "2015",
   #    x = "Day of the Month", 
    #   y = "Hours") +
  theme_light() +
  theme(panel.border = element_blank(),
        panel.background = element_rect(fill = "#424242"),
        plot.background = element_rect(fill = "#424242", colour = "#424242"),
        axis.ticks.x = element_blank(),
        axis.ticks.y = element_blank(),
        panel.grid = element_blank(),
        axis.text.x = element_blank(),
        axis.text.y = element_blank(),
        axis.title.x = element_blank(),
        axis.title.y = element_blank(),
        plot.title = element_blank(),
        plot.caption = element_blank(),
        legend.position="none",
        plot.margin = margin(.5,.5,.5,.5, "cm")) +
  theme(strip.background = element_blank()) +
  theme(strip.text = element_blank()) +
  #coord_cartesian(ylim=c(0, 3)) +
  transition_states(Month)

#all years

all_years_animated <- ggplot(r_comp, aes(x=day, y = minutes/60)) +
  geom_density(stat = "identity", fill = fill_color) +
  scale_y_reverse() +
  facet_wrap(~facet, strip.position = "top") +
  labs(title = "The Reading Habits 
of Horror Writer
K. Edwin Fritz
       ",
       subtitle = "{next_state}" ,
       x = "Month", 
       y = "Hours",
       caption = "Source: K. Edwin Fritz, www.fritzfiction.com
       Graphic: Cory Cone, dataviz.corycone.com") +
  theme_light() +
  g_a_theme_title +
  transition_states(Year)

animate(all_years_animated, fps = 30, duration = 10, width= 1000, height=800, "test.gif")  


#bar charts
bar1 <- ggplot(july_2018, aes(x=day, y = minutes/60)) +
  geom_bar(stat = "identity", fill = fill_color) +
  scale_y_reverse() +
  facet_wrap(~facet, strip.position = "top") +
  labs(title = "Guide", 
       x = "Day of the Month", 
       y = "Hours") +
  scale_x_continuous(breaks = july_2018$day) +
  theme(panel.border = element_blank(),
        panel.background = element_rect(fill = "#CCCCCC"),
        plot.background = element_rect(fill = "#424242", colour = "#424242"),
        axis.ticks.x = element_blank(),
        axis.ticks.y = element_blank(),
        panel.grid = element_blank(),
        axis.text.x = element_blank(),
        axis.text.y = element_blank(),
        axis.title.x = element_blank(),
        axis.title.y = element_blank(),
        plot.title = element_blank(),
        plot.caption = element_blank(),
        legend.position="none",
        plot.margin = margin(.5,.5,.5,.5, "cm")) +
  theme(strip.background = element_blank()) +
  theme(strip.text = element_blank()) +
  transition_states(day) + shadow_trail()
  #coord_cartesian(ylim=c(0, 3)) +

