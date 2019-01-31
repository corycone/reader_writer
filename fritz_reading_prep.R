#colors
fill_color <- "#CC0000"
color_color <- "darkred"
text_color <- "#161616"

#order by month
r_comp[is.na(r_comp)] <- 0
r_comp$facet = factor(r_comp$Month, 
                      levels = c("January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"))
#split data by year
r_years <- split(r_comp, as.factor(r_comp$Year))

#bar weekday averages
r_avg <- r_comp
r_avg[is.na(r_avg)] <- 0
r_avg$Weekday = factor(r_avg$Weekday, 
                       levels = c("Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"))


r_weekday_mean <- aggregate(r_avg[, 3], list(r_avg$Weekday), mean)
colnames(r_weekday_mean)[2] <- "Avg. Minutes"
colnames(r_weekday_mean)[1] <- "Weekday"

r_weekday_mean$`Avg. Minutes` = round(r_weekday_mean$`Avg. Minutes`, digits = 2)

#bar month averages
r_month_avg <- r_comp
r_month_avg[is.na(r_month_avg)] <- 0
r_month_avg$Month = factor(r_avg$Month, 
                           levels = c("January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"))

r_month_mean <- aggregate(r_month_avg[, 3], list(r_month_avg$Month), mean)
colnames(r_month_mean)[2] <- "Avg. Minutes"
colnames(r_month_mean)[1] <- "Month"

r_month_mean$`Avg. Minutes` = round(r_month_mean$`Avg. Minutes`, digits = 2)

#ggplot unified theme

g_theme <- theme_light() +
  theme(panel.border = element_blank(),
        panel.background = element_rect(fill = "#DDDDDD"),
        plot.background = element_rect(fill = "#DDDDDD", colour = "#DDDDDD"),
        axis.ticks.x = element_blank(),
        axis.ticks.y = element_blank(),
        panel.grid = element_blank(),
        axis.text.x = element_blank(),#element_text(colour = text_color, family = "Roboto Condensed Light"),
        axis.text.y = element_text(colour = fill_color, family = "Roboto Condensed Light"),
        axis.title.x = element_blank(),#element_text(colour = text_color, family = "Roboto Condensed Light"),
        axis.title.y = element_blank(),#element_text(colour = text_color, family = "Roboto Condensed Light"),
        plot.title = element_text(colour = text_color, size = 50, family = "Roboto Condensed Light"),
        plot.caption = element_text(color = text_color),
        legend.position="none",
        plot.margin = margin(.5,.5,.5,.5, "cm")) +
  theme(strip.background =element_rect(fill="#DDDDDD")) +
  theme(strip.text = element_text(colour = text_color, size = 9, family = "Roboto Condensed Light"))
  

#ggplot title them

g_theme_title <- theme_light() +
  theme(panel.border = element_blank(),
        panel.background = element_rect(fill = "#DDDDDD"),
        plot.background = element_rect(fill = "#DDDDDD", colour = "#DDDDDD"),
        axis.ticks.x = element_blank(),
        axis.ticks.y = element_blank(),
        panel.grid = element_blank(),
        axis.text.x = element_blank(),
        axis.text.y = element_blank(),
        axis.title.x = element_blank(),
        axis.title.y = element_blank(),
        plot.title = element_text(colour = text_color, size = 75, family = "Roboto Condensed Light"),
        plot.subtitle = element_text(colour = text_color, size = 25),
        plot.caption = element_blank(),
        legend.position="none",
        plot.margin = margin(.5,.5,.5,.5, "cm")) +
  theme(strip.background =element_rect(fill="#DDDDDD")) +
  theme(strip.text = element_text(colour = text_color, size = 9, family = "Roboto Condensed Light")) 

#ggplot animation title them

g_a_theme_title <- theme_light() +
  theme(panel.border = element_blank(),
        panel.background = element_rect(fill = "#DDDDDD"),
        plot.background = element_rect(fill = "#DDDDDD", colour = "#DDDDDD"),
        axis.ticks.x = element_blank(),
        axis.ticks.y = element_blank(),
        panel.grid = element_blank(),
        axis.text.x = element_blank(),#element_text(colour = text_color, family = "Roboto Condensed Light"),
        axis.text.y = element_text(colour = fill_color, family = "Roboto Condensed Light", size = 9),
        axis.title.x = element_blank(),#element_text(colour = text_color, family = "Roboto Condensed Light"),
        axis.title.y = element_text(colour = text_color, family = "Roboto Condensed Light", size = 9),
        plot.title = element_text(colour = text_color, size = 35, family = "Roboto Condensed Light"),
        plot.subtitle = element_text(colour = fill_color, size = 45, hjust = 0.5),
        plot.caption = element_text(colour = text_color, family = "Roboto Condensed Light", size = 6),
        legend.position="none",
        plot.margin = margin(1,1,1,1, "cm")) +
  theme(strip.background =element_rect(fill="#DDDDDD")) +
  theme(strip.text = element_text(colour = text_color, size = 15, family = "Roboto Condensed Light")) 


#ggplot example theme
g_theme_example <- theme_light() +
  theme(panel.border = element_blank(),
        panel.background = element_rect(fill = "#DDDDDD"),
        plot.background = element_rect(fill = "#DDDDDD", colour = "#DDDDDD"),
        #axis.ticks.x = element_blank(),
        #axis.ticks.y = element_blank(),
        panel.grid = element_blank(),
        axis.text.x = element_text(colour = text_color, family = "Roboto Condensed Light"),
        axis.text.y = element_text(colour = text_color, family = "Roboto Condensed Light"),
        axis.title.x = element_text(colour = text_color, family = "Roboto Condensed Light"),
        axis.title.y = element_text(colour = text_color, family = "Roboto Condensed Light"),
        plot.title = element_text(colour = text_color, size = 35, family = "Roboto Condensed Light"),
        plot.caption = element_text(color = text_color),
        legend.position="none",
        plot.margin = margin(.5,.5,.5,.5, "cm")) +
  theme(strip.background =element_rect(fill="#DDDDDD")) +
  theme(strip.text = element_text(colour = text_color, size = 9, family = "Roboto Condensed Light"))

#July 2018 for example plot
july_2018 <- subset(r_years$`2018`, r_years$`2018`$Month == "July")

