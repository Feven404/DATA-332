library(readxl)
library(dplyr)
library(tidyverse)
library(tidyr)
library(ggplot2)

rm(list = ls())
#setting up working directory
setwd('~/DATA 332/DATA/NP_EX_1-2.xlsx')

df_truck <- read_excel('~/DATA 332/DATA/NP_EX_1-2.xlsx', sheet = 2, skip = 3, .name_repair = 'universal')

#selecting comments
df <- df_truck [, c(4:15)]

#deselect columns
df <- subset(df, select = -c(...10))

#getting difference in days within a column 
date_min <- min(df$Date)
date_max <- max(df$Date)

number_of_days_on_the_road <- date_max - date_min
print(number_of_days_on_the_road)

days <- difftime(max(df$Date), min(df$Date))
print(days)
number_of_days_recorded <- nrow(df)

total_hours = sum(df$Hours)
avg_hrs_per_day_rec <- round(total_hours / number_of_days_recorded, digits = 3)
print(avg_hrs_per_day_rec)

#Total Expense
df$total_cost <- df$Misc + df$Tolls + df$fuel_cost
print(df$total_cost)

#Total Fuel Expense
df$fuel_cost <- df$Gallons * df$Price.per.Gallon
total_fuel_cost <- sum(df$fuel_cost)
print(total_fuel_cost)

#Other Expense
other_expense <- df$Misc + df$Tolls
print(other_expense)

df[c('warehouse', 'city_state')] <- str_split_fixed(df$Starting.Location, ',', 2)

#Total Gallons Consumed
total_gallons_consumed = sum(df$Gallons)
print(total_gallons_consumed)

#Total Miles Driven
df$total_miles_driven <- df$Odometer.Ending - df$Odometer.Beginning
print(total_miles_driven)

#Miles per Gallon
miles_per_gallon <- df$total_miles_driven / df$total_gallons_consumed
print(miles_per_gallon)

#Total Cost per Mile
total_cost_per_mile <- df$total_cost / df$total_miles_driven
print(total_cost_per_mile)

df$city_state <- gsub(',', "", df$city_state)

df[c('col1', 'col2')] <-
  str_split_fixed(df$city_state, ' ', 2)

#Starting Location Pivot
df[c('warehouse', 'starting_city_state')] <-
  str_split_fixed(df$Starting.Location, ',', 2)

df_starting_pivot <- df %>%
  group_by(starting_city_state) %>%
  summarize(count = n(),
            mean_size_hours = mean(Hours, na.rm = TRUE),
            sd_hours = sd(Hours, na.rm = TRUE),
            total_hours = sum(Hours, na.rm = TRUE),
            total_gallons = sum(Gallons, na.rm = TRUE)
            )

ggplot(df_starting_pivot, aes(x = starting_city_state, y = count)) +
  geom_col() +
  theme(axis.text = element_text(angle = 45, vjust = .5, hjust = 1))

#Ending Location Pivot
df$ending_city_state <- trimws(df$ending_city_state)

df[c('warehouse', 'ending_city_state')] <-
  str_split_fixed(df$Delivery.Location, ',', 2)
df$ending_city_state <- gsub(',', "", df$ending_city_state)

df_ending_pivot <- df %>%
  group_by(ending_city_state) %>%
  summarize(count = n(),
            mean_size_hours = mean(Hours, na.rm = TRUE),
            sd_hours = sd(Hours, na.rm = TRUE),
            total_hours = sum(Hours, na.rm = TRUE),
            total_gallons = sum(Gallons, na.rm = TRUE)
            )

ggplot(df_ending_pivot, aes(x = ending_city_state, y = count)) +
  geom_col() +
  theme(axis.text = element_text(angle = 45, vjust = .5, hjust = 1))

