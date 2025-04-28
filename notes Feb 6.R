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


##February 13 notes
###create a graph with x as flipper length and y as body mass

library(tidyverse)
library(palmerpenguins)

penguins %>% 
  ggplot(aes(x = flipper_length_mm,
             y = body_mass_g)) +
  geom_point()


penguins %>% 
  ggplot(aes(x = flipper_length_mm,
             y = body_mass_g)) +
  geom_area()
  
penguins %>% 
  filter(!is.na(flipper_length_mm)) %>% 
  filter(!is.na(body_mass_g)) %>% 
  ggplot(aes(x = body_mass_g,
             fill = species)) +
  geom_histogram(alpha = .5)

my_plot <- penguins %>% 
  filter(!is.na(flipper_length_mm)) %>% 
  filter(!is.na(body_mass_g)) %>% 
  ggplot(aes(x = body_mass_g,
             y = flipper_length_mm,
             color = species)) +
  geom_point()

my_2nd_plot <- my_plot + stat_ellipse()

ggsave("penguin graph.jpg", plot = my_2nd_plot,
       width = 6, height = 8, dpi = 300)

## load DatasaurusDozen.tsv

datasaurus_dat <- read_tsv('Data/DatasaurusDozen.tsv')
head(dat)

read.delim('Data/DatasaurusDozen.tsv')
dim(datasaurus_dat)#1846 3
head(datasaurus_dat)
str(datasaurus_dat)

datasaurus_dat %>% 
  ggplot(aes(x = x,
             fill = dataset))+
  geom_density()

datasaurus_dat %>% 
  ggplot(aes(x = x,
             y = y,
             fill = dataset))+
  geom_point()+
  facet_wrap(~ dataset)

install.packages('GGally')
library(GGally)
ggpairs(penguins)

install.packages('')
