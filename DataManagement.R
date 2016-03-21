#transform() imply function to every row and store the result
mydata<-data.frame(x1 = c(2, 2, 6, 4),
x2 = c(3, 4, 2, 8))
mydata <- transform(mydata, sumx = x1 + x2, meanx = (x1 + x2)/2)

#creating dataframe
manager <- c(1, 2, 3, 4, 5)
date <- c("10/24/08", "10/28/08", "10/1/08", "10/12/08", "5/1/09")
country <- c("US", "US", "UK", "UK", "UK")
gender <- c("M", "F", "F", "M", "F")
age <- c(32, 45, 25, 39, 99)
q1 <- c(5, 3, 3, 3, 2)
q2 <- c(4, 5, 5, 3, 2)
q3 <- c(5, 2, 5, 4, 1)
q4 <- c(5, 5, 5, NA, 2)
q5 <- c(5, 5, 2, NA, 1)
leadership <- data.frame(manager, date, country, gender, age,
q1, q2, q3, q4, q5, stringsAsFactors=FALSE)

#creat a popup window to rename parameters
fix(leadership)

#omit NA value
newLeaderShip <- na.omit(leadership)

#data type test and convert
a <- c(1,2,3)
is.array(a)
as.array(a)

#sorting data
leadershipAge1 <- leadership[order(leadership$age),]
leadershipAge1 <- leadership[order(leadership$gender,leadership$age),]
leadershipAge1 <- leadership[order(leadership$gender,-leadership$age),]


#numerical functions
abs(x)
sqrt(x)
x <- 34.532246
ceiling(x)
floor(x)
round(x, digits = 2)
signif(x, digits = 3) #round number to significant digits
sin(x)
cos(x)
tan(x)
sqrt(c(2,3,4))

#statistical functions
x <- c(1,2,3,4,5,6,7,8,9)
mean(x)
max(x)
min(x)
quantile(x)
quantile(x, .60)
range(x)
sum(x)
scale(x)
scale(x, center = 0, scale = 10)
length(x)
#standarizing data
newdata <- scale(x)
newdata <- scale(x)*SD +M #SD is desired standard deviation and M is mean
#standard a special column
newdata <- transform(myData, myvar = scale(myvar)*SD + M)

#