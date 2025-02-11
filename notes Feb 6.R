##notes Feb 6
library(tidyverse)
library(palmerpenguins)
## for a plot graph
penguins %>% 
  filter(body_mass_g > 5000) %>% 
  ggplot(aes(x = body_mass_g,
             y = bill_length_mm,
             color = species)) +
  geom_point()

## for a bar graph

penguins %>% 
  filter(body_mass_g > 3000) %>% 
  group_by(species) %>%
  summarise(mean_body_mass_g = mean(body_mass_g),
            sd_body_mass_g = sd(body_mass_g)) %>% 
  ggplot(aes(x = mean_body_mass_g,
             color = species)) +
  geom_bar()

penguins %>% 
  ggplot(aes(x = bill_length_mm,
             y = body_mass_g,
             colour = species)) +
  geom_point() +
  scale_color_manual(values = c( 'Gentoo'='pink','Adelie'='lightblue','Chinstrap'='black'))+
  theme_dark()+
  

install.packages('ghibli')
library(ghibli)

## bar graph
penguins %>% 
  ggplot(aes(x = flipper_length_mm))+
  geom_bar()

penguins %>% 
  ggplot(aes(x = flipper_length_mm,
             y = body_mass_g,
             fill = species))+
  geom_col(position = 'dodge')


  