fill_color <- "red"

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
        panel.background = element_rect(fill = "#F3F7F7"),
        plot.background = element_rect(fill = "#F3F7F7", colour = "#F3F7F7"),
        axis.ticks.x = element_blank(),
        axis.ticks.y = element_blank(),
        panel.grid = element_blank(),
        legend.position="none",
        plot.margin = margin(1,1,1,1, "cm")) +
  theme(strip.background =element_rect(fill="#F3F7F7")) +
  theme(strip.text = element_text(colour = "black", size = 9)) #+
  #scale_fill_brewer(palette = "Paired")

