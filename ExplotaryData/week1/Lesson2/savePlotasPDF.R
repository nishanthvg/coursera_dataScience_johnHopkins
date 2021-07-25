x <- rnorm(100)
y <- rnorm(100) + x
pdf(file = "PLOT.pdf")
plot(x,y, main = "Dumy Plot", col = "blue", pch = 20)
dev.off()