## Notes Feb 11
library(tidyverse)
library(palmerpenguins)
rm(list = ls())

library(tidyverse)
library(palmerpenguins)

penguins %>% 
  ggplot(aes(x = species))+
  geom_bar(stat = 'count')

penguins %>% 
  ggplot(aes(x = species, y = body_mass_g))+
  geom_col()#default is stacked

penguins %>% 
  ggplot(aes(x = species, y = body_mass_g))+
  geom_col(position = 'dodge')#dodge unstacks data

penguins %>% 
  group_by(species) %>% 
  summarise(avg_mass = mean(body_mass_g, na.rm = T))#some data missing

penguins %>% 
  group_by(species) %>% 
  summarise(max_mass = mean(body_mass_g, na.rm = T))

penguins %>% 
  ggplot(aes(x = species, fill = island))+
  geom_bar(stat = 'count', position = 'dodge')

penguins %>% 
  group_by(species) %>% 
  summarise(avg_mass = mean(body_mass_g, na.rm = T),
            sd = sd(body_mass_g, na.rm = T)) %>% 
  ggplot(aes(x = species, y = avg_mass))+
  geom_bar(stat = 'identity')+
  geom_errorbar(aes(ymin = avg_mass - sd,
                    ymax = avg_mass + sd),
                width = 0.2)

penguins %>% 
  group_by(species) %>% 
  summarise(avg_mass = mean(body_mass_g, na.rm = T)) %>% 
  ggplot(aes(x = species, y = avg_mass))+
  geom_bar(stat = 'identity')
  
##making an interesting graph for penguins data, not geom point
penguins %>% 
  group_by(island) %>% 
  ggplot(aes(x = island, y = species))+
  geom_col(position = 'dodge')+
  scale_color_manual(values = c('gentoo'='pink', 'adelle'='turquoise','chinstrap'='purple'))


data("penguins")
penguins %>% 
  ggplot(aes(x = body_mass_g, fill = species))+
  geom_density()
  
penguins %>% 
  filter(!is.na(body_mass_g)) %>% 
  ggplot(aes(x = body_mass_g, fill = species))+
  geom_density(alpha = 0.2)## shows the distribution curve

penguins %>% 
  filter(!is.na(body_mass_g)) %>% 
  ggplot(aes(x = body_mass_g, y = species))+
  geom_boxplot()+
  geom_point()


install.packages('qrcode')
library(qrcode)


