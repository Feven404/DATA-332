#Chapter 4
deck <- read.csv('~/DATA 332/HW Deck Data/deck.csv')
#Selecting Values
head(deck)

deck[1,1]

deck[1, c(1,2,3)]

new <- deck[1, c(1,2,3)]
new

vec <- c(6,1,3,6,10,5)
vec[1:3]

#Negative Integers
deck[-(2:52), 1:3]

deck[c(-1,1), 1]

#Zero
deck[0,0]

#Blank Spaces
deck[1,]

#Logical Values
deck[1, c(TRUE, TRUE, FALSE)]

rows <- c(TRUE, F, F, F, F, F, F, F, F, F, F, F, F, F, F, F,
          F, F, F, F, F, F, F, F, F, F, F, F, F, F, F, F, F, F, F, F, F, F,
          F, F, F, F, F, F, F, F, F, F, F, F, F, F)
deck[rows,]

#Names
deck[1, c("face", "suit", "value")]

deck[ , "value"]

#Deal Card
deal <- fucntion(cards) {
  cards[1, ]
}

dea(deck)

#Shuffle the Deck
deck <- deck[1:52, ]
head(deck2)

deck3 <- deck[c(2,1,3:52), ]
head(deck3)

random <- sample(1:52, size = 52)
random

deck4 <- deck[random, ]
head(deck4)

shuffle <- function(cards) {
  random <- sample(1:52, size = 52)
  cards[random, ]
  }
deal(deck)
deal(deck2)

#Dollar Signs and Double Brackets
deck$value
mean(deck$value)
median(deck$value)

lst <- list(numbers = c(1,2), logical = TRUE, strings = c("a", "b", "c"))
lst

lst[1]
sum(lst$numbers)
lst[[1]]
lst["numbers"]
lst[["numbers"]]
