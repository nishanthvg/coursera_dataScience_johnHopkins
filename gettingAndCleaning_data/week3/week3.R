#subsetting 
set.seed(13435)
x <- data.frame("var1" = sample(1:5), "var2" = sample(6:10), "var3" = sample(11:15))
x$var2[c(1,3)] = NA

#access the data 
x[(x$var1 <= 3 & x$var3 > 11), ]

x[(x$var1 < 3), ]
x[which(x$var1 < 3), ] # same output as the above

#sorting the whole data frame wrt column 
x[order(x$var1),]
x[order(x$var1, x$var2),]
x[order(x$var1, x$var2, x$var3),]

  #another library to srot the data frame according to a col 
library(plyr)
arrange(x, var1)
arrange(x, desc(var1))


#add a col 
x$var4 <- rnorm(5)
#or 
cbind(x, rnorm(5))


#summarising the data 
if(!file.exists("./data")) {
  dir.create("./data")
}
fileUrl <- "https://data.cityofnewyork.us/api/views/825b-niea/rows.csv?accessType=DOWNLOAD"
download.file(fileUrl, destfile = "./data/business.csv", method ="curl")#method argument is required for https 
data <- read.csv("./data/business.csv")
#to check the data 
head(data, n = 3) #n tells the number of rows 
tail(data, n = 3)

#gives a overall summary 
summary(data)
str(data)

#resData 
resdata <- read.csv("./data/Restaurants.csv")
#checking for missing data 
sum(is.na(resdata$councilDistrict))
any(is.na(resdata$councilDistrict))
all(resdata$zipCode > 0)
colSums(is.na(resdata))

#table 
table(resdata$zipcode, useNA = "ifany")
table(resdata$coucilDistrict,resdata$zipcode)

  #checking for a specific val count 
table(resdata$zipcode %in% c("21212"))

d <- resdata[resdata$zipcode %in% c("21212"), ]

#reshapping a dataset
install.packages("reshape2")
library(reshape2)
head(mtcars)

  #melting the dataset 
mtcars$carNames  <- rownames(mtcars)
melData <- melt(mtcars, id = c("carNames", "gear", "cyl"), measure.vars = c("mpg", "hp"))
head(melData, n = 3)
tail(melData, n = 3)

#casting the dataset -creating a new data according to necessary condition 
cylData <- dcast(melData, cyl ~ variable) # basically gives the mpg and hp value for the asked cylinders 

cylData1 <- dcast(melData, cyl ~ variable, mean)#gives mean of mpg and hp of the respective cylinders 


  #Averaging the values 
head(InsectSprays)
tapply(InsectSprays$count, InsectSprays$spray, sum)

spIns <- split(InsectSprays$count, InsectSprays$spray)
sprayCount<-lapply(spIns, sum)
unlist(sprayCount)

sapply(spIns, sum)
