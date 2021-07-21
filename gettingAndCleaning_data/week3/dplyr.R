install.packages("dplyr")
library(dplyr)
if(!file.exists("./data")){
  dir.create("./data")
}
# 3. make handle
fileURL <- "https://github.com/DataScienceSpecialization/courses/blob/master/03_GettingData/dplyr/chicago.rds?raw=true"
# 4. download data
download.file(fileURL, destfile = "./data/chicago.rds", method = "curl", extra='-L')

data <- readRDS("./data/chicago.rds")
head(data, n = 3)
names(data)
#select statement 
head(select(data, (city:dptp))) #helps in selecting the columns 
head(select(data -(city:dptp)))
  #brute force process in r for the above statement
i <- match("city", names(data))
j <- match("dptp", names(data))
head(data[, i:j])

#filter statement _ can be used as filter
data_fil <- filter(data, pm25tmean2 > 30)
head(data_fil)

data_fil <- filter(data, pm25tmean2 > 30 & o3tmean2 > 10)

#arrange statement - arranges a particular statement 
data_arr <- arrange(data, date)
head(data_arr)
tail(data_arr)

#rename statement - renames 
data <- rename(data, pm10 = pm10tmean2)
head(data)

#mutate statement - adding new column
data <- mutate(data, pm10detrend = pm10 - mean(pm10, na.rm = TRUE))
head(data)

#summarise 
data <- mutate(data, tempcat = factor(1*(tmpd > 80), labels = c("cold", "hot")))
head(data)

hotcold <- group_by(data,tempcat) 
head(hotcold)

summarize(hotcold, pm10 = mean(pm10, na.rm= TRUE), o3 = max(o3tmean2), no2 = mean(no2tmean2))