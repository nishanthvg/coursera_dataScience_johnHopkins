pollutant <- function(directory, pollutant, id=1:332) {
  pollutants = c()
  
  filenames = list.files(directory)
  for(i in id) {
    filepath = paste(directory, "/", filenames[i], sep="")
    data = read.csv(filepath, header = TRUE)
    pollutants = c(pollutants, data[ ,pollutant])
  }
  
  pollutantMean = mean(pollutants, na.rm = TRUE)
  pollutantMean
}


complete <- function(directory, id = 1:332) {
  ids = c()
  nobbs = c()
  
  filenames = list.files(directory)
  for(i in id) {
    filepath = paste(directory, "/", filenames[i], sep="")
    data = read.csv(filepath, header=TRUE)
    completeData = data[complete.cases(data), ]
    ids = c(ids, i)
    nobbs = c(nobbs, nrow(completeData))
  }
  data.frame(id = ids, nobs = nobbs)
}


