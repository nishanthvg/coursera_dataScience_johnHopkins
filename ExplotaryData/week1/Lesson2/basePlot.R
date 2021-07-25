library(datasets)
with(airquality, plot(Wind, Ozone , main = "wind Vs ozone", type = "n",)) #type = "n" - intialises the graphics , will not plot anything 
with(subset(airquality, Month == 5), points(Wind, Ozone, col = "blue" ,pch = 20))
with(subset(airquality, Month != 5), points(Wind, Ozone, col = "red" ,pch = 20))
legend("topright", pch = 1, col = c("blue", "red"), legend = c("May", "Other month"))

#to add a regression 
model <- lm(Ozone ~ Wind, airquality) 
abline(model, lw = 2)


#multiple plots 
par(mfrow = c(1,2), mar = c(4,4,2,1), oma = c(0,0,2,0))
with(airquality,{ 
     plot(Wind, Ozone, main = "Wind vs Ozone", col ="blue", pch = 20)
     plot(Solar.R, Ozone, main = "Solar.R vs Ozone", col = "red", pch = 20)
     mtext("Ozone graph", outer = TRUE)
     }
     )