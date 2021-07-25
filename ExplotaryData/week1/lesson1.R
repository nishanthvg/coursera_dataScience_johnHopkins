pollution <- read.csv("data/avgpm25.csv", colClasses = c("numeric", "character", "factor", "numeric", "numeric"))
head(pollution)

#summary of the pm25 column
summary(pollution$pm25)

#1 dimentional plot 
#box plot 
boxplot(pollution$pm25)
abline(h = 12)
#histogram
hist(pollution$pm25, col = "blue")
rug(pollution$pm25)
abline(v = 12, lwd = 2)
abline(v = median(pollution$pm25), col = "magenta", lwd = 2)

#bar plot 
barplot(table(pollution$region), main ="Number of counties in each region", col = "wheat")

#2 dimentional plot 
#boxplot 
boxplot(pm25 ~ region, data = pollution, col = "green")

#histogram 
par(mfrow = c(2,1), mar= c(4,4,2,1))
hist(pollution[which(pollution$region == "east"), ]$pm25, col = "green")
hist(subset(pollution, region == "west")$pm25, col = "blue")

#scatter plot 
par(mfrow = c(1,2), mar= c(4,4,2,1))
with(subset(pollution , region == "east"), plot(latitude, pm25, main = "east"))
abline(h = 12, lwd = 2, lty = 2,col = "red")
with(subset(pollution, region == "west"), plot(latitude, pm25, main = "west"))
abline(h = 12, lwd = 2, lty = 2,col = "red")

