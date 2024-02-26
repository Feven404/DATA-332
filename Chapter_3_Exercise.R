#Chapter 3
#Atomic Vectors
die <- c(1, 2,3, 4, 5, 6)
die
is.vector(die)

five <- 5
five
is.vector(5)
length(5)
length(die)

int <- 1L
text <- "ace"

int <- c(1L, 5L)
text <- c("ace", "hearts")

sum(num)
sum(text)

#Doubles
die < c(1, 2, 3, 4, 5, 6)
die
typeof(die)

#Integers
int < c(1L, 2L, 4L)
int
typeof(int)

sqrt(2)^2-2

#Characters
text <- c("Hello", "World")
text

typeof(text)
typeof("Hello")

#Exercise
#"1" and "one" are strings while 1 is a number.

#Logicals
3 > 4

logic <- c(TRUE, FALSE,TRUE)
logic
typeof(logic)
typeof(F)

#Complex and Raw
comp <- c(1 + 1i, 1+ 2i, 1 + 3i)
typeof(comp)

raw(3)
typeof(raw(3))

#Exercise
flush_faces <- c("ace", "king", "queen", "jack", "ten")
flush_faces
typeof(flush_faces)

#Attributes
attributes(die)

#Names
names(die)
names(die) <- c("one", "two", "three", "four", "five", "six")
names(die)
attributes(die)
die
die + 1

names(die) <- c("uno", "dos", "tres", "quatro", "clinco", "seis")
die

names(die) <- NULL
die

#Dim
dim(die) <- c(2, 3)
die

dim(die) <- c(2, 3)
die

dim(die) <- c(1, 2, 3)
die

#Matrices
m <- matrix(die, nrow = 2)
m

m <- matrix(die, nrow = 2, byrow = TRUE)
m

#Arrays
ar <- array(c(11:14, 21:24, 31:34), dim = c(2, 2, 3))
ar

#Exercise
royal_flush <- c("ace", "king", "queen", "jack", "ten", "spades", "spades", "spades", "spades", "spades")
matrix(royal_flush, nrow = 5)
matrix(royal_flush, ncol = 2)
dim(royal_flush) <- c(5, 2)
royal_flush

#Class
dim(die) <- c(2, 3)
typeof(die)
class(die)
attributes(die)

class("Hello")
class(5)

#Dates and Times
now <- Sys.time()
now
typeof(now)
class(now)

unclass(now)

mil <- 1000000
mil

class(mil) <- c("POSIXct", "POSIXt")
mil

#Factors
gender <- factor(c("male", "female", "female", "male"))
typeof(gender)
attributes(gender)

unclass(gender)
gender

as.character(gender)

#Exercise
card <- c("ace", "hearts", 1)
card

#Coercion
sum(c(TRUE, TRUE, FALSE, FALSE))
sum(c(1, 1, 0, 0))

as.character(1)
as.logical(1)
as.numberic(FALSE)

#Lists
list1 <- list(100:130, "R", list(TRUE, FALSE))
list1

#Exercise
card <- list("ace", "hearts", 1)
card

#Data Frames
df <- data.frame(face = c("ace", "two", "six"), 
                 sui = c("clubs", "clubs", "clubs"), value = c(1, 2, 3))
df

typeof(df)
class(df)
str(df)

df <- data.frame(face = c("ace", "two", "six"),
                 suit = c("clubs", "clubs", "clubs"), value = c(1, 2, 3),
                 sringAsFacors = FALSE)
deck <- data.frame(
  face = c("king", "queen", "jack", "ten", "nine", "eight", "seven", "six",
           "five", "four", "three", "two", "ace", "king", "queen", "jack", "ten",
           "nine", "eight", "seven", "six", "five", "four", "three", "two", "ace",
           "king", "queen", "jack", "ten", "nine", "eight", "seven", "six", "five",
           "four", "three", "two", "ace", "king", "queen", "jack", "ten", "nine", 
           "eight", "seven", "six", "five", "four", "three", "two", "ace"),
           suit = c("spades", "spades", "spades", "spades", "spades", "spades",
                    "spades", "spades", "spades", "spades", "spades", "spades", "spades",
                    "clubs", "clubs", "clubs", "clubs", "clubs", "clubs", "clubs", "clubs",
                    "clubs", "clubs", "clubs", "clubs", "clubs", "diamonds", "diamonds",
                    "diamonds", "diamonds", "diamonds", "diamonds", "diamonds", "diamonds",
                    "diamonds", "diamonds", "diamonds", "diamonds", "diamonds", "hearts",
                    "hearts", "hearts", "hearts", "hearts", "hearts", "hearts", "hearts",
                    "hearts", "hearts", "hearts", "hearts", "hearts"),
  value = c(13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 13, 12, 11, 10, 9, 8,
            7, 6, 5, 4, 3, 2, 1, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 13, 12, 11,
            10, 9, 8, 7, 6, 5, 4, 3, 2, 1)
)

#Loading Data
head(deck)

#Saving Data
write.csv(deck, file = "cards.csv", row.names = FALSE)
getwd()
