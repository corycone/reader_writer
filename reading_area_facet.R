library(xlsx)
library(ggplot2)

r_comp <- read.xlsx("data/all_reading.xlsx", sheetName = "all_reading")
r_comp_15 <- subset(r_comp, Year == "2015")
r_comp_15[is.na(r_comp_15)] <- 0


ggplot(r_comp_15, aes(x=day, y = minutes/60, fill = Month)) +
  scale_fill_brewer(palette = "Set3") +
  geom_area() +
  facet_wrap(~Month, strip.position = "bottom") +
  labs(title = "Time Spent Reading in 2015", 
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