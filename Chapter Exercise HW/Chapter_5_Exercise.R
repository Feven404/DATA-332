#Chapter 5
deck <- read.csv('~/DATA 332/HW Deck Data/deck.csv')

deck2 <- deck

#Changing Values in Place
vec <- c(0,0,0,0,0,0)
vec
vec[1]

vec[1] <- 1000
vec

vec[c(1, 3, 5)] <- c(1, 1, 1)
vec

vec[4:6] <- vec[4:6] + 1
vec

vec[7] <- 0
vec

deck2$new <- 1:52
head(deck2)

deck2$new <- NULL
head(deck2)

deck2[c(13, 26, 39, 52), ]
deck2[c(13, 26, 39, 52), 3]
deck2$value[c(13, 26, 39, 52)]

deck2$value[c(13, 26, 39, 52)] <- c(14, 14, 14, 14)

head(deck2, 13)

shuffle <- function(cards) {
  random <- sample(1:52, size = 52)
  cards[random, ]
}

deck3 <- shuffle(deck)

head(deck3)

#Logical Subsetting
vec
vec[c(FALSE, FALSE, FALSE, FALSE, TRUE, FALSE, FALSE)]

#Logical Tests
1>2
1 > c(0, 1, 2)

1 %in% c(3, 4, 5)
c(1, 2) %in% c(3, 4, 5)

#Exercise
deck2$face
deck2$face == "ace"

sum(deck2$face == "ace")

deck3$face == "ace"

deck3$value[deck3$face == "ace"]

deck3$value[deck3$face == "ace"] <- 14
head(deck3)

deck4 <- deck
deck4$value <- 0
head(deck4, 13)

#Exercise
deck4$suit == "hearts"
deck4$value[deck4$suit == "hearts"]
deck4$value[deck4$suit == "hearts"]
deck4$value[deck4$suit == "hearts"]
deck4$value[deck4$suit == "hearts"]
deck4[deck4$suit == "spades", ]

#Boolean Operators
a <- c(1, 2, 3)
b <- c(1, 2, 3)
c <- c(1, 2, 4)
a == b
b == c

deck4$face == "queen" & deck4$suit == "spades"

queenOfSpades <- deck4$face == "queen" & deck4$suit == "spades"

deck4[queenOfSpades, ]
deck4$value[queenOfSpades]

deck4$value[queenOfSpades] <- 13
deck4[queenOfSpades, ]

#Exercise
w <- c(-1, 0, 1)
x <- c(5, 15)
y <- "February"
z <- c("Monday", "Tuesday", "Friday")
w > 0
10 < x & x < 20
y == "February"
all(z %in% c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday",
             "Saturday", "Sunday"))

deck5 <- deck
head(deck5, 13)

facecard <- deck5$face %in% c("king", "queen", "jack")
deck5[facecard, ]

deck5$value[facecard] <- 10
head(deck5, 13)

#Missing Information
1 + NA

#na.rm
c(NA, 1:50)
mean(c(NA, 1:50))
mean(c(NA, 1:50), na.rm = TRUE)

#is.na
NA == NA
c(1, 2, 3, NA) == NA
is.na(NA)
vec <- c(1, 2, 3, NA)
is.na(vec)

head(deck5, 13)










