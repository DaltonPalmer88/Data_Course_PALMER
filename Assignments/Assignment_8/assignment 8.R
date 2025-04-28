library(tidyverse)
library(ggplot2)
library(readxl)
library(measurements)
library(janitor)
library(caret)
library(dplyr)

mushroom_data <- read.csv('../../Data/mushroom_growth.csv')
View(mushroom_data)

mushroom_data%>% 
  ggplot(aes(x = GrowthRate,
             y = Light)) +
  geom_point()

mushroom_data%>% 
  ggplot(aes(x = GrowthRate,
             y = Nitrogen)) +
  geom_point()

mushroom_data%>% 
  ggplot(aes(x = GrowthRate,
             y = Humidity)) +
  geom_point()

mushroom_data%>% 
  ggplot(aes(x = GrowthRate,
             y = Temperature)) +
  geom_point()

mod1 <- glm(data = mushroom_data,
            formula = GrowthRate ~ Light + Temperature)
summary(mod1)

mod2 <- glm(data = mushroom_data,
            formula = GrowthRate ~ Light + Temperature + Nitrogen)
summary(mod2)

mod3 <- glm(data = mushroom_data,
            formula = GrowthRate ~ Light + Temperature + Nitrogen + Humidity)
summary(mod3)

mod4 <- glm(data = mushroom_data,
            formula = GrowthRate ~ Light + Nitrogen + Humidity)
summary(mod4)

calculate_mse <- function(mod1, mushroom_data) {
  predictions <- predict(mod1, mushroom_data)
actual <- mushroom_data$GrowthRate
mse <- mean((actual - predictions)^2)
return(mse)}

mse_mod1 <- calculate_mse(mod1, mushroom_data)
mse_mod1

calculate_mse <- function(mod2, mushroom_data) {
  predictions <- predict(mod2, mushroom_data)
  actual <- mushroom_data$GrowthRate
  mse <- mean((actual - predictions)^2)
  return(mse)}

mse_mod2 <- calculate_mse(mod2, mushroom_data)
mse_mod2

calculate_mse <- function(mod3, mushroom_data) {
  predictions <- predict(mod3, mushroom_data)
  actual <- mushroom_data$GrowthRate
  mse <- mean((actual - predictions)^2)
  return(mse)}

mse_mod3 <- calculate_mse(mod3, mushroom_data)
mse_mod3

calculate_mse <- function(mod4, mushroom_data) {
  predictions <- predict(mod4, mushroom_data)
  actual <- mushroom_data$GrowthRate
  mse <- mean((actual - predictions)^2)
  return(mse)}

mse_mod4 <- calculate_mse(mod4, mushroom_data)
mse_mod4

bestmodel<- mod3

#hypothetical data
mushroom_data$Humidity <- factor(mushroom_data$Humidity)
mushroom_data$Species <- factor(mushroom_data$Species)

humidity_levels <- levels(mushroom_data$Humidity)
species_levels <- levels(mushroom_data$Species)



hypothetical_data <- data.frame(
  Light = c(10, 20, 30),
  Nitrogen = c(15, 25, 35),
  Temperature = c(5, 10, 15),
  Humidity = factor(c('Low', 'Low', "High"), levels = levels(mushroom_data$Humidity)),
  Species = factor(c('P.ostreotus', 'P.ostreotus', 'P.ostreotus'), levels = levels(mushroom_data$Species)))
view(hypothetical_data)

#predict growth rates
hypothetical_data$PredictedGrowthRate <- predict(bestmodel, newdata = hypothetical_data) 
print(hypothetical_data)

##plot predictions along real data 
ggplot() +
  geom_point(data = mushroom_data, aes(x = Light, y = GrowthRate, color = 'Actual'), alpha = 0.6) +
  geom_point(data = hypothetical_data, aes(x = Light, y = PredictedGrowthRate, color = 'Predicted'), size = 3, shape = 17) +
  facet_wrap(~ Humidity) +
  scale_color_manual(values = c("Actual" = "magenta", "Predicted" = "yellow")) +
  labs(title = 'Actual VS. Predicted Growth Rates',
       x = 'Light',
       y = 'Growth Rate',
       color = 'Data Type') +
  theme_minimal()
  











