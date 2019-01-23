library(xlsx)
library(ggplot2)

r_comp <- read.xlsx("data/all_reading.xlsx", sheetName = "all_reading")
r_comp_15 <- subset(r_comp, Year == "2015")
r_comp_15[is.na(r_comp_15)] <- 0

ggplot(r_comp_15, aes(x = Date, y = minutes)) +
  geom_line(col = "red") +
  theme_minimal() +
  labs(title = "Reading vs Writing - 2015 | K. Edwin Fritz", 
       x = "Minutes", 
       y = "Month",
       caption = "The personal logs of author K. Edwin Fritz") +
  theme(axis.text.x = element_text(color = "#151515", angle = 0, hjust = 1, size = 7),
        axis.text.y = element_text(angle = 0, hjust = 1, size = 7, color = "#151515"),
        panel.border = element_blank(),
        axis.ticks.x = element_blank(),
        axis.ticks.y = element_blank(),
        panel.grid = element_blank(),
        plot.title = element_text(color = "#151515", size = 14),
        axis.title.x = element_text(color = "#151515", size = 9),
        axis.title.y = element_text(color = "#151515", size = 9),
        plot.caption=element_text(size = 7, color = "#151515"),
        legend.position="right",
        plot.margin = margin(1,1,1,1, "cm")) +
  scale_x_date(date_breaks = "1 month", date_minor_breaks = "1 week", date_labels = "%B")

