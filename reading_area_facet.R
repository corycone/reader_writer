library(xlsx)
library(ggplot2)
library(gridExtra)

r_comp <- read.xlsx("data/all_reading.xlsx", sheetName = "all_reading")

#subset and facet 2015
r_comp_15 <- subset(r_comp, Year == "2015")
r_comp_15[is.na(r_comp_15)] <- 0
r_comp_15$facet = factor(r_comp_15$Month, 
                         levels = c("January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"))

#subset and facet 2016
r_comp_16 <- subset(r_comp, Year == "2016")
r_comp_16[is.na(r_comp_16)] <- 0
r_comp_16$facet = factor(r_comp_16$Month, 
                         levels = c("January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"))

#subset and facet 2017
r_comp_17 <- subset(r_comp, Year == "2017")
r_comp_17[is.na(r_comp_17)] <- 0
r_comp_17$facet = factor(r_comp_17$Month, 
                         levels = c("January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"))

#subset and facet 2018
r_comp_18 <- subset(r_comp, Year == "2018")
r_comp_18[is.na(r_comp_18)] <- 0
r_comp_18$facet = factor(r_comp_18$Month, 
                         levels = c("January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"))

p <- ggplot(r_comp_15, aes(x=day, y = minutes/60, fill = Month)) +
  scale_fill_brewer(palette = "Set3") +
  geom_area() +
  facet_wrap(~facet, strip.position = "bottom") +
  labs(title = "2015", 
       x = "Day of the Month", 
       y = "Hours",
       caption = "Source: Fritz") +
  theme_light() +
  theme(panel.border = element_blank(),
        axis.ticks.x = element_blank(),
        axis.ticks.y = element_blank(),
        panel.grid = element_blank(),
        legend.position="none",
        plot.margin = margin(1,1,1,1, "cm")) +
  theme(strip.background =element_rect(fill="White")) +
  theme(strip.text = element_text(colour = "black", size = 9))

p2 <- ggplot(r_comp_16, aes(x=day, y = minutes/60, fill = Month)) +
  scale_fill_brewer(palette = "Set3") +
  geom_area() +
  facet_wrap(~facet, strip.position = "bottom") +
  labs(title = "2016", 
       x = "Day of the Month", 
       y = "Hours",
       caption = "Source: Fritz") +
  theme_light() +
  theme(panel.border = element_blank(),
        axis.ticks.x = element_blank(),
        axis.ticks.y = element_blank(),
        panel.grid = element_blank(),
        legend.position="none",
        plot.margin = margin(1,1,1,1, "cm")) +
  theme(strip.background =element_rect(fill="White")) +
  theme(strip.text = element_text(colour = "black", size = 9))

p3 <- ggplot(r_comp_17, aes(x=day, y = minutes/60, fill = Month)) +
  scale_fill_brewer(palette = "Set3") +
  geom_area() +
  facet_wrap(~facet, strip.position = "bottom") +
  labs(title = "2017", 
       x = "Day of the Month", 
       y = "Hours",
       caption = "Source: Fritz") +
  theme_light() +
  theme(panel.border = element_blank(),
        axis.ticks.x = element_blank(),
        axis.ticks.y = element_blank(),
        panel.grid = element_blank(),
        legend.position="none",
        plot.margin = margin(1,1,1,1, "cm")) +
  theme(strip.background =element_rect(fill="White")) +
  theme(strip.text = element_text(colour = "black", size = 9))

p4 <- ggplot(r_comp_18, aes(x=day, y = minutes/60, fill = Month)) +
  scale_fill_brewer(palette = "Set3") +
  geom_area() +
  facet_wrap(~facet, strip.position = "bottom") +
  labs(title = "2018", 
       x = "Day of the Month", 
       y = "Hours",
       caption = "Source: Fritz") +
  theme_light() +
  theme(panel.border = element_blank(),
        axis.ticks.x = element_blank(),
        axis.ticks.y = element_blank(),
        panel.grid = element_blank(),
        legend.position="none",
        plot.margin = margin(1,1,1,1, "cm")) +
  theme(strip.background =element_rect(fill="White")) +
  theme(strip.text = element_text(colour = "black", size = 9))

grid.arrange(p, p2, p3, p4, nrow = 4, ncol=1, top = "The Reading Habits of Horror Writer K. Edwin Fritz, 2015-2018")