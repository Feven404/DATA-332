#Chapter2
#Scatterplot graph
x <- c(-1, -0.8, -0.6, -0.4, -0.2, 0, 0.2, 0.4, 0.6, 0.8, 1)
x
y <- x^3
y
qplot(x,y)

#Histogram
x <- c(1,2,2,2,3,3)
qplot(x, binwidth = 1)

x2 <- c(1,1,1,1,1,2,2,2,2,3,3,4)
qplot(x2, bindwidth = 1)

#Exercise
#I think the histogram will have 4 bars with a width of 1 and their height will be from 0-4 (depending on each numbers frequency).
x3 <- c(0,1,1,2,2,2,3,3,4)
qplot(x3, bindiwdth = 1)

roll <- function() {
  die <- 1:6
  dice <- sample(die, size = 2, replace = TRUE)
  sum(dice)
}

#checking accuracyn
replicate(3,1+1)
replicate(10, roll())

rolls <- replicate(10000, roll())
qplot(rolls, binwidth = 1)

#Exercise
roll <- function() {
  die <- 1:6
  dice <- sample(die, size = 2, replace = TRUE,
                 prob = c(1/8,1/8,1/8,1/8,1/8,3/8))
  sum(dice)
}
rolls <- replicate(10000, roll())
qplot(rolls, binwidth = 1)
