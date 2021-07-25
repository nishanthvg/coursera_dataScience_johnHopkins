#lattice plot - ploting all the plots with a single function 
library(lattice)
state <-data.frame(state.x77, region = state.region)
xyplot(Life.Exp ~ Income | region, data = state, layout = c(4,1))


#ggplots - mix of base and lattice ploting 
library(ggplot2)
data(mpg)
qplot(displ, hwy, data = mpg)

#choose a system and start plotting 


library(datasets)
with(airquality, plot(Wind, Ozone , main = "wind Vs ozone", type = "n",)) #type = "n" - intialises the graphics , will not plot anything 
with(subset(airquality, Month == 5), points(Wind, Ozone, col = "blue" ,pch = 20))
with(subset(airquality, Month != 5), points(Wind, Ozone, col = "red" ,pch = 20))
legend("topright", pch = 1, col = c("blue", "red"), legend = c("May", "Other month"))

#to add a regression 
model <- lm(Ozone ~ Wind, airquality) 
abline(model, lw = 2)