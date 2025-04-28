##April 3

library(tidyverse)
library(ggplot2)
library(readxl)
library(measurements)
library(janitor)


dat <- read.csv('Data/GradSchool_Admissions.csv')
view(dat)

mod1 <- glm(data = dat,
           formula = as.logical(admit) ~ gre + gpa + rank,
           family = 'binomial')

dat$pred_1 <- predict(mod1, dat, type = 'response')

mod2 <- glm(data = dat,
            formula = as.logical(admit) ~ gre + gpa*rank,
            family = 'binomial')

compare_performance(mod1, mod2) %>% plot()

dplyr::select()

dat %>% 
  mutate(outcome = case_when(pred_1 > 0.4 ~ 'admit',
                             pred_1 >= 0.2 & pred_1 <= 0.4 ~ 'IDK',
                             pred_1 < 0.2 ~ 'not admit')) %>% 
  mutate(accurate = case_when(admit == 1 & outcome == 'admit' ~TRUE,
                              admit == 0 & outcome == 'not admit' ~ TRUE,
                              TRUE ~ FALSE)) %>% 
  pluck('accurate') %>% 
  sum()/nrow(dat)

library(MASS)
stepAIC()

full_model <- glm(data = dat,
                  formula = as.logical(admit) ~ gre*gpa*rank,
                  family = 'binomial')
full_model$formula
summary(full_model)

stepAIC(full_model)

stepwise_mod <- stepAIC(full_model, direction = 'both')  

best_model <- glm(data = dat,
                  formula = stepwise_mod$formula,
                  family = 'binomial')  
compare_performance(mod1, mod2, best_model) %>% plot()

view(dat)

dat$pred_2

library(caret)
install.packages('caret')
library(caret)

id <- createDataPartition(dat$admit, p = 0.8, list = F)
dat_train <- dat[-id, ]


