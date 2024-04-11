#CHAPTER 6
#ENVIRONMENTS
library(devtools)
parenvs(all=TRUE)

deck <- read.csv('~/DATA 332/HW Deck Data/deck.csv')
cards <- list("ace", "hearts", 1)
deal <- function(cards){
  cards[1, ]
}

#Working with Environments
as.environment("package:stats")
globalenv()
baseenv()
emptyenv()
parent.env(globalenv())
parent.env(emptyenv())
ls(emptyenv())
ls(globalenv())
head(globalenv()$deck, 3)
assign("new", "Hello Global", envir = globalenv())
globalenv()$new

#The Active Environment
environment()

#Assignment
new
new <- "Hello Active"
roll <- function(){
  die <- 1:6
  dice <- sample(die, size = 2, replace = TRUE)
  sum(dice)
}

#Evaluation
show_env <- function(){
  list(ran.in = environment(),
       parent = parent.env(environment()),
       objects = ls.str(environment()))
}
show_env()

environment(show_env)
environment(parenvs)

show_env <- function(){
  a <- 1
  b <- 2
  c <- 3
  list(ran.in = environment(),
       parent = parent.env(environment()),
       objects = ls.str(environment()))
}
show_env()

foo <- "take me to your runtime"
show_env <- function(x = foo){
  list(ran.in = environment(),
       parent = parent.env(environment()),
       objects = ls.str(environment()))
}
show_env()

deal <- function() {
  deck[1, ]
}

#Exercise
#Yes
environment(deal)
deal()

DECK <- deck
deck <- deck[-1, ]
head(deck, 3)
deal <- function() {
  card <- deck[1, ]
  deck<- deck[-1, ]
  card
}
#Exercise
deal <- function(){
  card <- deck[1, ]
  assign("deck", deck[-1, ], envir = globalenv())
  card
}
deal()
shuffle <- function(cards) {
  random <- sample(1:52, size = 52)
  cards[random, ]
}
head(deck, 3)
a <- shuffle(deck)
head(a, 3)
#Exercise
shuffle <- function(){
  random <- sample(1:52, size = 52)
  assign("deck", DECK[random, ], envir = globalenv())
}

#Closures
shuffle()
deal()
setup <- function(deck) {
  DECK <- deck
  DEAL <- function() {
    card <- deck[1, ]
    assign("deck", deck[-1, ], envir = globalenv())
    card
  }
  SHUFFLE <- function(){
    random <- sample(1:52, size = 52)
    assign("deck", DECK[random, ], envir = globalenv())
  }
}
setup <- function(deck) {
  DECK <- deck
  DEAL <- function() {
    card <- deck[1, ]
    assign("deck", deck[-1, ], envir = globalenv())
    card
  }
  SHUFFLE <- function(){
    random <- sample(1:52, size = 52)
    assign("deck", DECK[random, ], envir = globalenv())
  }
  list(deal = DEAL, shuffle = SHUFFLE)
}
cards <- setup(deck)
deal <- cards$deal
shuffle <- cards$shuffle
deal
environment(deal)
environment(shuffle)
setup <- function(deck) {
  DECK <- deck
  DEAL <- function() {
    card <- deck[1, ]
    assign("deck", deck[-1, ], envir = parent.env(environment()))
    card
  }
  SHUFFLE <- function(){
    random <- sample(1:52, size = 52)
    assign("deck", DECK[random, ], envir = parent.env(environment()))
  }
  list(deal = DEAL, shuffle = SHUFFLE)
}
cards <- setup(deck)
deal <- cards$deal
shuffle <- cards$shuffle
rm(deck)
shuffle()
deal()