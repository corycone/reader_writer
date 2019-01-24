library(xlsx)
library(ggplot2)
library(gridExtra)

r_comp <- read.xlsx("data/all_reading.xlsx", sheetName = "all_reading")
source("fritz_reading_prep.R")

#2015 Reading
p <- ggplot(r_comp_15, aes(x=day, y = minutes/60, fill = Month)) +
  scale_fill_brewer(palette = "Set3") +
  geom_area() +
  facet_wrap(~facet, strip.position = "bottom") +
  labs(title = "2015", 
       x = "Day of the Month", 
       y = "Hours",
       caption = "Source: Fritz") +
  g_theme +
  theme(strip.background =element_rect(fill="White")) +
  theme(strip.text = element_text(colour = "black", size = 9))

#2016 Reading  
p2 <- ggplot(r_comp_16, aes(x=day, y = minutes/60, fill = Month)) +
  scale_fill_brewer(palette = "Set3") +
  geom_area() +
  facet_wrap(~facet, strip.position = "bottom") +
  labs(title = "2016", 
       x = "Day of the Month", 
       y = "Hours",
       caption = "Source: Fritz") +
  g_theme +
  theme(strip.background =element_rect(fill="White")) +
  theme(strip.text = element_text(colour = "black", size = 9))

#2017 Reading
p3 <- ggplot(r_comp_17, aes(x=day, y = minutes/60, fill = Month)) +
  scale_fill_brewer(palette = "Set3") +
  geom_area() +
  facet_wrap(~facet, strip.position = "bottom") +
  labs(title = "2017", 
       x = "Day of the Month", 
       y = "Hours",
       caption = "Source: Fritz") +
  g_theme +
  theme(strip.background =element_rect(fill="White")) +
  theme(strip.text = element_text(colour = "black", size = 9))

#2018 Reading
p4 <- ggplot(r_comp_18, aes(x=day, y = minutes/60, fill = Month)) +
  scale_fill_brewer(palette = "Set3") +
  geom_area() +
  facet_wrap(~facet, strip.position = "bottom") +
  labs(title = "2018", 
       x = "Day of the Month", 
       y = "Hours",
       caption = "Source: Fritz") +
  g_theme +
  theme(strip.background =element_rect(fill="White")) +
  theme(strip.text = element_text(colour = "black", size = 9))

#Average reading by Weekday
p_avg <- ggplot(r_weekday_mean, aes(x = Weekday, y = `Avg. Minutes`, Fill = "Green")) +
  #scale_color_brewer(palette = "Set3") +
  geom_bar(stat = "identity") +
  labs(title = "Average Minutes Read by Weekday | 2015 - 2018", 
       x = "Day of the Week", 
       y = "Average Minutes Read") +
  g_theme

#arrange all plots

grid.arrange(p, p2, p3, p4, nrow = 5, ncol=1, top = "The Reading Habits of Horror Writer K. Edwin Fritz, 2015-2018")
