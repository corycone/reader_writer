library(xlsx)
library(ggplot2)

r2015 <- read.xlsx("data/all_reading.xlsx", sheetName = "all_reading")

ggplot(r2015, aes(x = reorder(day, day), Month, size = minutes, fill = minutes)) +
  geom_raster() +
  scale_fill_gradient(low = "red", high = "yellow") +
  theme_minimal() +
  labs(title = "Heatmap of Reading Minutes | K. Edwin Fritz", 
       x = "Day", 
       y = "Month",
       caption = "The personal logs of author K. Edwin Fritz") +
  coord_equal()

