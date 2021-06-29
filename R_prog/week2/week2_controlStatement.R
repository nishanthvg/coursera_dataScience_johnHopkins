##if else statement 
x=2
if(x > 2) {
  y = 3
} else {
  y =4
}
print(y)

y <- if(x > 3) {
  3
} else {
  4
}

print(y)

## for loop
a = c("a","b","c")
for(i in 1:3) {
  print(a[i])
}

for(i in seq_along(a)) {
  print(a[i])
}

for(letter in a) {
  print(letter)
}

for(i in 1:3) print(a[i])

  ##nested loop 
b = matrix(1:6,2,3)
for(i in seq_len(nrow(b))) {
  for(j in seq_len(ncol(b))) {
    print(b[i,j])
  }
}

##while loop 
count = 0
while(count < 2) {
  print(count)
  count = count + 1
}

##repeRt
x = 0
repeat {
  if(x > 2) {
    break
  }
  x = x +1
}
print(x)


##next - used to skip an iteration 
for(i in 1:30) {
  if(i <= 20){
    next
  }
  print(i)
}

