path <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(path, destfile = "quizQ1.csv", method="curl")
data <- read.csv("quizQ1.csv")


library(xlsx)
