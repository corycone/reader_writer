#load fonts
loadfonts(device = "win")

#subset and facet 2015
r_comp_15 <- subset(r_comp, Year == "2015")
r_comp_15[is.na(r_comp_15)] <- 0
r_comp_15$facet = factor(r_comp_15$Month, 
                         levels = c("January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"))

#subset and facet 2016
r_comp_16 <- subset(r_comp, Year == "2016")
r_comp_16[is.na(r_comp_16)] <- 0
r_comp_16$facet = factor(r_comp_16$Month, 
                         levels = c("January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"))

#subset and facet 2017
r_comp_17 <- subset(r_comp, Year == "2017")
r_comp_17[is.na(r_comp_17)] <- 0
r_comp_17$facet = factor(r_comp_17$Month, 
                         levels = c("January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"))

#subset and facet 2018
r_comp_18 <- subset(r_comp, Year == "2018")
r_comp_18[is.na(r_comp_18)] <- 0
r_comp_18$facet = factor(r_comp_18$Month, 
                         levels = c("January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"))


#bar averages
r_avg <- r_comp
r_avg[is.na(r_avg)] <- 0
r_avg$Weekday = factor(r_avg$Weekday, 
                       levels = c("Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"))

r_weekday_mean <- aggregate(r_avg[, 3], list(r_avg$Weekday), mean)
colnames(r_weekday_mean)[2] <- "Avg. Minutes"
colnames(r_weekday_mean)[1] <- "Weekday"

r_weekday_mean$`Avg. Minutes` = round(r_weekday_mean$`Avg. Minutes`, digits = 2)

#ggplot unified theme

g_theme <- theme_light(base_family = 'Georgia') +
  theme(panel.border = element_blank(),
        axis.ticks.x = element_blank(),
        axis.ticks.y = element_blank(),
        panel.grid = element_blank(),
        legend.position="none",
        plot.margin = margin(1,1,1,1, "cm"))

