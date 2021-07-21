if(!file.exists("data")){
  dir.create("data")
}

fileUrl <- "https://www.stats.govt.nz/assets/Uploads/Business-price-indexes/Business-price-indexes-September-2020-quarter/Download-data/business-price-indexes-september-2020-quarter-corrections-to-previously-published-statistics.csv"
download.file(fileUrl, destfile = "./data/business.csv", method ="curl")#method argument is required for https 
list.files("./data")

dateDownloaded <- date()

#reading files 
businessData <- read.table("./data/business.csv", sep=",", header=TRUE)
head(businessData)
#read.csv("./data/business.csv") - just read.csv default sep as ","

#for excell file - library(xlsx) read.xlsx("./data/camera.xlsx", sheetIndex = 1, header="TRUE")

#XML
library(XML)
filePath <- "http//:w3schools.com/xml/simple.xml"
doc <- xmlTreeParse(filePath, useInternal=TRUE)
rootNode <- xmlRoot(doc)
xmlName(rootNode)

names(rootNode)


#JSON
library(jsonlite)
url <- "https://api.github.com/users/hadley/orgs"
jsonData <- fromJSON(url)
names(jsonData)
#to json 
tojson <- toJSON(iris, pretty=TRUE)
cat(tojson)
