library(xlsx)
library(ggplot2)

reader <- read.xlsx("data/reader_data.xlsx", sheetName = "reading")
r2015 <- read.xlsx("data/reader_data.xlsx", sheetName = "2015r")

ggplot(reader, aes(x = year, y = hours, fill = reader$month)) +
  geom_bar(stat = "identity") +
  scale_color_brewer(palette = "Set2") +
  theme_light() +
  labs(title = "5 Years of Reading by K. Edwin Fritz", 
       x = "Year", 
       y = "Hours Read",
       caption = "The personal logs of author K. Edwin Fritz")


  