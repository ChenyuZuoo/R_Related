library(datasets)
data(mtcars)

#create a new window to show the plot
x11() 
plot(mtcars$wt, mtcars$mpg, xlab = "Weight", ylab = "Miles gallon", main = "Regression of MPG on weight")
dev.off()

#create pdf file to store plot
pdf("mggraph.pdf") #png(), jpeg(), bmp() also could be used
plot(mtcars$wt, mtcars$mpg, xlab = "Weight", ylab = "Miles gallon", main = "Regression of MPG on weight")
abline(lm(mtcars$mpg ~ mtcars$wt))
dev.off()

#polt parameters exercise
dose <- c(20,30,40,45,60)
durgA <- c(16,20,27,40,60)
durgB <- c(15,18,25,31,40)

opar <- par(no.readonly = T)
par(lty = 2, pch = 16)
plot(dose, durgA, type = "b")
par(opar)

#cex specifies the symbol size
plot(dose, durgA, lty = 3, pch = 16, cex = .75, type = "b")

#color scheme
plot(dose, durgA, lty = 3, pch = 16, cex = .75, type = "b", col.axis = "blue")
plot(dose, durgA, lty = 3, pch = 16, cex = .75, type = "b", col.axis = "blue", fg = "red")

n <- 10
mycol <- rainbow(n)
pie(rep(1:n), labels = mycol, col = mycol)

par(font.main = 4, cex.main = 2, font.lab = 3, cex.lab = 1.5)
pie(rep(1:n), labels = mycol, col = mycol, main = "rainbow colour")

#text
par(cex.main = 2, font.lab = 2)
plot(dose, durgA, type = "b", main = "trials for durgA", sub = "this is a test", xlab = "dosage", ylab = "Drug response", xlim = c(0, 70))
#remove all the text
par(ann = FALSE)
plot(dose, durgA, type = "b", main = "trials for durgA", sub = "this is a test", xlab = "dosage", ylab = "Drug response", xlim = c(0, 70))

#Customize axes
# x <- c(1:10)
y <- x
z <- 10/x
par(opar)
par(mar = c(5,4,4,8) + 0.1)
#suppress axes, axes = F, xaxt = "n", yaxt = "n"
plot(x, y, type = "b", lty = 3, pch = 21, col = "red", ann = F, yaxt = "n")
lines(x, z, type = "b", pch = 22, col = "blue", lty = 2)
axis(2, at = x, labels = x, col.axis = "red", las = 0, cex.axis = .85)
axis(4, at = z, labels = round(z, digits = 2), col.axis = "blue", las = 2, cex.axis = .7)
#las labels are parallel(=0) or perpendicular(=2) to the axis
mtext("z = 10/x", side = 4, line = 3,  cex.lab = 1, las = 2, col = "blue")
mtext("y = x", side = 2, line = 2, cex.lab = 1, las = 0, col = "red")
title("An test of axes", xlab = "X Values")

#legend
plot(dose, durgA, pch = 15, lty = 1, type = "b", ylim = c(0,60), main = "drugA VS drugB", xlab = "dosage", ylab = "Drug Response", col = "blue")
lines(dose, durgB, pch = 17, lty = 2, type = "b", col = "green")
abline(h = 30, lty = 2, col = "gray", pch = 17)

library(Hmisc)
minor.tick(nx = 3, ny = 3) #add minor ticks

legend("topleft", title = "Durg Type", inset = .05, c("A", "B"), lty = c(1, 2), pch = c(15,17), col = c("blue", "green"))

#text annotation
attach(mtcars)
head(mtcars)
plot(wt, mpg, main = "Mileage VS Car Weight", xlab = "Weight", ylab = "Mileage", pch = 17, col = "blue")
text(wt, mpg, row.names(mtcars), cex = 0.6, pos = 4)



#reset par(), par() will reset in a new device
resetPar <- function(){
  dev.new()
  op <- par(no.readonly = TRUE)
  dev.off()
  op
}

par(resetPar())