##March 25
library(tidyverse)
library(ggplot2)
library(readxl)
library(measurements)
library(janitor)
mpg


mpg %>% 
  ggplot(aes(x = displ, y = cty))+
  geom_point()

mod <- glm(data = mpg,
           formula = cty ~ displ)
summary(mod)

cty = 25.99 + (-2.63)*displ

mpg %>% 
  ggplot(aes(x = displ, y = cty))+
  geom_point()+
  geom_smooth(method = 'glm', se = F)

str(mod)
mod$model
mod$formula
mod$coefficients
mod$fitted.values

cty = 25.99 + (-2.63)*displ
plot(mod$model$cty, mod$fitted.values)
cor.test(mod$model$cty, mod$fitted.values)
install.packages('easystats')
library(easystats)
report(mod)
performance(mod)

check_model(mod)

mod <- glm(data = mpg,
           formula = cty ~ displ)
names(mpg)

mod2 <- glm(data = mpg,
           formula = cty ~ displ + manufacturer + model +trans)
summary(mod2)

mod1 <- glm(data = mpg,
           formula = cty ~ displ)

mod2 <- glm(data = mpg,
           formula = cty ~ displ + cyl)
summary(mod2)

mod3 <- glm(data = mpg,
           formula = cty ~ displ *cyl)
summary(mod3)

compare_models(mod1, mod2, mod3)
compare_performance(mod1, mod2, mod3) %>% plot()

predict(mod1, mpg)
mod1$formula

plot(mod1$fitted.values, predict(mod1, mpg))

cty = 25.99 + (-2.63)*dat_displ$displ

dat_displ <- data.frame(displ = 1:100)
View(dat_displ)

##march 27 

library(palmerpenguins)

## does body weight vary between penguin species

dat_peng <- penguins

names(dat_peng)

mod <- glm(data = dat_peng,
    formula = body_mass_g ~ species)
summary(mod)

dat_peng$species <- relevel(dat_peng$species, ref = 'Gentoo')

mod <- glm(data = dat_peng,
           formula = body_mass_g ~ species)
summary(mod)

dat_peng$species <- factor(dat_peng$species, levels = c('Gentoo', 'Chinstrap', 'Adelie'))
mod <- glm(data = dat_peng,
           formula = body_mass_g ~ species)
summary(mod)

names(dat_peng)
view(dat_peng)

dat_p <- dat_peng %>% 
  mutate(gentoo = case_when(species == "Gentoo" ~ TRUE,
                            TRUE ~ FALSE))

glm(data = dat_p,
    formula = gentoo ~ bill_length_mm + bill_depth_mm + flipper_length_mm + body_mass_g,
    family = 'binomial')

mod <- glm(data = dat_p,
    formula = gentoo ~ bill_length_mm + bill_depth_mm + flipper_length_mm + body_mass_g,
    family = 'binomial')

predict(mod, dat_p)
predict(mod, dat_p, type = 'response')
dat_p$pred <- predict(mod, dat_p, type = 'response')
View(dat_p)

dat_p %>% 
  ggplot(aes(x = body_mass_g, y = pred, color = species))+
  geom_point()

pred <- dat_p %>% 
  mutate(outcome = case_when(pred < 0.01 ~ 'Not Gentoo',
                              pred > 0.75 ~ 'Gentoo')) %>% 
  select(species, outcome) %>% 
  mutate(accurate = case_when(species == 'Gentoo' & outcome == 'Gentoo' ~ TRUE,
                              species != 'Gentoo'& outcome == 'Not Gentoo' ~ TRUE,
                              TRUE ~ FALSE))
  
pred %>% 
  pluck('accurate') %>% 
  sum()/nrow(pred)

dat <- read.csv('Data/GradSchool_Admissions.csv')
view(dat)  

mod3 <- glm(data = dat,
            formula = as.logical(admit) ~ cyl*displ; )


cyl*displ = 

  
  




