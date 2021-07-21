install.packages("BiocManager")
BiocManager::install("rhdf5")


library(rhdf5)
created = h5createFile("example.h5")
#creating groups 
created = h5createGroup("example.h5", "foo")
created = h5createGroup("example.h5", "baa")
created = h5createGroup("example.h5", "foo/foobaa")#sub group foo 
h5ls("example.h5")

#write to groups 
a = matrix(1:10,5,2)
h5write(a,"example.h5", "foo/a")
h5ls("example.h5")

#reading data 
readA = h5read("example.h5","foo/a")

#updating a group 
h5write(c(13,12,11),"example.h5", "foo/a", index =list(1:3,1))
