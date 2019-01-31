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
  transition_reveal(minutes, keep_last = TRUE)
  
animate(anim, fps = 30, duration = 2)  


anim2 <- ggplot(r_years$`2018`, aes(x=day, y = minutes/60)) +
  geom_area(fill = fill_color) +
  scale_y_reverse() +
  facet_wrap(~facet, strip.position = "top") +
  labs(title = "2018", 
       x = "Day of the Month", 
       y = "Hours",
       caption = "Source: K. Edwin Fritz, www.fritzfiction.com
       Graphic: Cory Cone, dataviz.corycone.com") +
  g_theme + #coord_cartesian(ylim=c(0, 3)) +
  transition_reveal(minutes, keep_last = TRUE)

animate(anim2, fps = 30, duration = 6)  

