library(xlsx)
library(ggplot2)

reader <- read.xlsx("data/reader_data.xlsx", sheetName = "reading")

ggplot(reader, aes(x = year, y = hours, fill = reader$month)) +
  geom_bar(stat = "identity") +
  theme_light()