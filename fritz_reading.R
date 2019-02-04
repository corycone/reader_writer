#load libraries

library(xlsx)
library(ggplot2)
library(dplyr)
library(gridExtra)
library(tidyverse)
library(extrafont)
library(gganimate)
library(cairoDevice)

#the below commented code is for importing the Google Font Roboto Condensed Light after it has been installed locally
#font_import #for first time run (take a long time to run)  
#loadfonts(device = "win") #for first time run


#load data
r_comp <- read.xlsx("data/all_reading.xlsx", sheetName = "all_reading")

#run data prep scripts (facets, theme, some math)
source("fritz_reading_prep.R")

#2015 Reading
p <- ggplot(r_years$`2015`, aes(x=day, y = minutes/60)) +
  geom_density(stat = "identity", fill = fill_color, color = "#660000") +
  scale_y_reverse() +
  facet_wrap(~facet, strip.position = "top") +
  labs(title = "2015", 
       x = "Day of the Month", 
       y = "Hours") +
  g_theme

#2016 Reading  
p2 <- ggplot(r_years$`2016`, aes(x=day, y = minutes/60)) +
  geom_density(stat = "identity", fill = fill_color, color = "#660000") +
  scale_y_reverse() +
  facet_wrap(~facet, strip.position = "top") +
  labs(title = "2016", 
       x = "Day of the Month", 
       y = "Hours") +
  g_theme

#2017 Reading
p3 <- ggplot(r_years$`2017`, aes(x=day, y = minutes/60)) +
  geom_density(stat = "identity", fill = fill_color, color = "#660000") +
  scale_y_reverse() +
  facet_wrap(~facet, strip.position = "top") +
  labs(title = "2017", 
       x = "Day of the Month", 
       y = "Hours") +
  g_theme

#2018 Reading
p4 <- ggplot(r_years$`2018`, aes(x=day, y = minutes/60)) +
  geom_density(stat = "identity", fill = fill_color, color = "#660000") +
  scale_y_reverse() +
  facet_wrap(~facet, strip.position = "top") +
  labs(title = "2018", 
       x = "Day of the Month", 
       y = "Hours",
       caption = "Source: K. Edwin Fritz, www.fritzfiction.com
       Graphic: Cory Cone, dataviz.corycone.com") +
  g_theme

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

title_plot <- ggplot(july_2018, aes(x=day, y = minutes/60, width = 1)) +
  geom_blank() +
  scale_y_reverse() +
  #facet_wrap(~facet, strip.position = "top") +
  labs(title = "The Reading Habits
of Horror Writer
K. Edwin Fritz",
      # subtitle = "K. Edwin Fritz",
       x = "Month", 
       y = "Average Minutes Read") +
    g_theme_title


#how to read these plots, plot
example <- ggplot(july_2018, aes(x=day, y = minutes/60, width = 1)) +
  geom_density(stat = "identity", fill = fill_color) +
  scale_y_reverse() +
  facet_wrap(~facet, strip.position = "top") +
  labs(title = "Guide", 
       x = "Day of the Month", 
       y = "Hours") +
  scale_x_continuous(breaks = july_2018$day) +
  g_theme_example



#arrange all plots
final <- grid.arrange(title_plot, p, p2, p3, p4, nrow = 5, ncol=1)

# interesting || final2 <- plot_grid(title_plot, p, p2, p3, p4, nrow = 5, rel_heights = c(1, 1, 1, 1, 1))

ggsave("fritz_reading_screen.png", final , width = 18, height = 45, dpi = 72, limitsize = FALSE, device=Cair co_png)

#note: I crop them empty space at the top in Photoshop, because try as I might, I can't get rid of it here




