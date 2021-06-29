x <- c("1","2") ##any data type can be implemented, the c function will automatically detect it 

y <- vector("numeric", length = 10) ## default intialisation

##if in c function, elements are of not same type, then it chooses any one of the type 
z <- c(1, "a")

## explicit typecasting or also called as coersion
a <- 1.3
class(a)
as.character(a)

##sequence of number
b <- 0:7
class(b)
as.logical(b)


##list - element in the list can contain multiple  data type
c = list(1, "!", TRUE, 1+0i) ## [[]] -> are the index

##matrix - are filled col wise - can be seen in the examples 2
d <- matrix(nrow = 2, ncol = 2)
print(d)

dim(d) ##gives dimension that is size of row and col 
attributes(d) ## gives all the methods used on matrix and its value


ex1 <- matrix(c(1,2,3,4,5,6,7,8), nrow = 4, ncol = 2) ##example 
ex2 <- matrix(1:8, nrow = 4, ncol = 4)
print(ex2)

##vector to matrix 
f <- 1:8
dim(f) <- c(2,4)
print(f)

##column and row binding 
g <- 1:3
h <- 4:6
cbind(g,h)
rbind(g,h)

##factors - catagorial array that is character array which can be used for ordered and unordered list 
i <- factor(c("yes","yes","no","no"))
print(i)
table(i)
unclass(i)

  ##levels can be set for explicitly mentioning the order - compare it with the above 
j <- factor(c("yes","yes","no","no"), levels = c("yes", "no"))
print(j)

##MIssing values na and nan - all nan are na but all na are not nan
k <- c(1,2,3,NA,NaN)
is.na(k)
is.nan(k)

##data frame 
l <- data.frame(fo = 0:4, b = c("T","F", "T", "T", "T"))
print(l)
nrow(l)
ncol(l)

##names 
  ##sequence of number 
m <- 1:3
names(m) <- c("foo", "bar", "norf")
print(m)
names(m)
  ##list of number 
n <- list(a = 1, b = 2, c = 3)
names(n)
print(n)
  ##matices 
o <- matrix(1:4, nrow = 2, ncol = 2)
dimnames(o) <- list(c("a", "b"), c("c", "d"))
print(o)
  
##dput and dget function 
p <- data.frame(a = 1, b = "a")
print(p)
dput(p)
dput(p, file="p.R")
new.p <- dget("p.R")
print(p)

##dump function 
q <- "foo"
r <- data.frame(a = 1, b = "x")
dump(c("q","r"), file="data.R")
rm(q,r)
source("data.R")
print(q)
print(r)

##subsetting 
s <- c("a","b","c","d","e")
print(s[1]) ##1st type of subetting numeric subnetting 
s[1:4]
s[s>"a"]
t <- s > "a"
print(t)
s[t]

  ##subsetting list 
u <- list(foo = 1:4, b = 0.2,c = "a")
print(u[1])
print(u[[1]])
print(u["b"])
print(u[["b"]])
print(u$foo)
print(u$b)

name <- "foo"
print(u[[name]])
print(u$name) ##can't use variable with $ operator 

  ##for multiple access from the list
print(u[c(1,2)])

v <- list(a = list(1,2,3), b = list(4,5,6))
print(v[[c(1,2)]])
print(v[[1]][[2]])

  ##matrices 
w<-matrix(1:6,2,3)
print(w[1,2])##returns a vector
print(w[1,])
print(w[, 2])
print(w[1,2, drop = FALSE]) ##return a matrix 

##partial matching in subsetting 
x <- list(aasknfi = 1:2)
print(x$a) ##partial name is enough for the r to detect 
print(x[["a"]])##while double bracket subnetting, the wording should be exact - error
print(x[["a", exact=FALSE]]) ##should be explicitly mentioned 


##removing na from the list 
z <- list(1,2,NA,3,4)
bad <- is.na(z)
z[!bad]

a1<-c(1,2,NA,3,NA)
a2 <- c(4,5,NA,3,NA)
good <- complete.cases(a1,a2)
print(good)
a1[good]
a2[good]

##vectorised operation 
x <- 1:4; y <- 5:8
x+y
x*y
x>2
x == 8
x/y

a3 <- matrix(1:4,2,2); a4<-matrix(rep(10,4),2,2)
a3*a4##normal multiplication
a3+a4
a3%*%a4 ##matrix multiplication 
