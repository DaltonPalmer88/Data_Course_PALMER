library(tidyverse)
library(ggplot2)
library(readxl)
library(measurements)
library(janitor)



glm()

##anova
library(palmerpenguins)

mod <- aov(data = penguins,
           formula = body_mass_g ~ species + sex + year)
summary(mod)
names(penguins)


mod_glm <- glm(data = penguins,
               formula = body_mass_g ~ species)

summary(mod_glm)







