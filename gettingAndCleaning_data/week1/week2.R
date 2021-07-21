ucscDb <- dbConnect(MySQL(), user="genome", host="genome-mysql.soe.ucsc.edu")
result <- dbGetQuery(ucscDb,"show databases;"); dbDisconnect(ucscDB);
#specific database in the server
hg19 <- dbConnect(MySQL(), user="genome",db="hg19" ,host="genome-mysql.soe.ucsc.edu")
allTables <- dbListTables(hg19)
#specific table from hg19
specificTable <- dbReadTable(hg19, "affyU133Plus2")
head(specificTable)
#specific table from hg19 - listing all the fields that is column names
specificTable_col <- dbListFields(hg19,"affyU133Plus2")
#to get the rows count
specificTable_rowCount <- dbGetQuery(hg19, "select count(*) from affyU133Plus2")

#specific subset from a table 
query <- dbSendQuery(hg19,"select * from affyU133Plus2 where misMatches between 1 and 3")
affyMis <- fetch(query); quantile(affyMis$misMatches)
#to select small portion
affyMisSmall<- fetch(query, n=10); dbClearResult(query)
dbDisconnect(hg19)
