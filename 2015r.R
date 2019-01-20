library(xlsx)
library(ggplot2)

r2015 <- read.xlsx("data/reader_data.xlsx", sheetName = "2015ra")

ggplot(r2015, aes(x = Month, y = Minutes)) +
  geom_bar(stat = "identity") +
  theme_light() +
  labs(title = "2015 Reading | K. Edwin Fritz", 
       x = "Month", 
       y = "Minutes Read",
       caption = "The personal logs of author K. Edwin Fritz")

str(reader)



