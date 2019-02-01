#load libraries

library(xlsx)
library(ggplot2)
library(dplyr)
library(gridExtra)
library(tidyverse)
library(extrafont)
library(gganimate)
library(cairoDevice)
options(gganimate.dev_args = list(type = "cairo"))

#load data
r_comp <- read.xlsx("data/all_reading.xlsx", sheetName = "all_reading")

#run data prep scripts (facets, theme, some math)
source("fritz_reading_prep.R")

#all years animation

all_years_animated <- ggplot(r_comp, aes(x=day, y = minutes/60)) +
  geom_density(stat = "identity", fill = fill_color, color = "#660000") +
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
  theme(panel.border = element_blank(),
        panel.grid =  element_blank(),
        panel.background = element_rect(fill = "#fbfaf8"),
        plot.background = element_rect(fill = "#fbfaf8", colour = "#fbfaf8"),
        axis.ticks.x = element_blank(),
        axis.ticks.y = element_blank(),
        axis.text.x = element_blank(),#element_text(colour = text_color, family = "Roboto Condensed Light"),
        axis.text.y = element_text(colour = fill_color, family = "Roboto Condensed Light", size = 9),
        axis.title.x = element_blank(),#element_text(colour = text_color, family = "Roboto Condensed Light"),
        axis.title.y = element_text(colour = text_color, family = "Roboto Condensed Light", size = 9),
        plot.title = element_text(colour = text_color, size = 50, family = "Roboto Condensed Light"),
        plot.subtitle = element_text(colour = fill_color, face = "bold", size = 100, hjust = .8, vjust = 55),
        plot.caption = element_text(colour = text_color, family = "Roboto Condensed Light", size = 6),
        legend.position="none",
        plot.margin = margin(1,1,1,1, "cm")) +
  theme(strip.background =element_rect(fill="#fbfaf8")) +
  theme(strip.text = element_text(colour = text_color, size = 15, family = "Roboto Condensed Light")) + 
  transition_states(Year)

animate(all_years_animated, fps = 30, duration = 10, width= 1000, height=800)

