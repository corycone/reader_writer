library(ggplot2)
library(gganimate)

anim <- ggplot(july_2018, aes(x=day, y = minutes)) +
  geom_area(fill = fill_color) +
  scale_y_reverse() +
  facet_wrap(~facet, strip.position = "top") +
  labs(title = "Guide", 
       x = "Day of the Month", 
       y = "Hours") +
  scale_x_continuous(breaks = july_2018$day) +
  g_theme_example +
  transition_reveal(day, keep_last = TRUE)
  
animate(anim, fps = 30, duration = 2)  

