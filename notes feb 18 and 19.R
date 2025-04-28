#notes feb 2/18/25
library(tidyverse)
library(palmerpenguins)

penguins %>% 
  filter(!is.na(flipper_length_mm) & !is.na(body_mass_g)) %>%
  ggplot(aes(x = body_mass_g,
             fill = species))+
  geom_histogram(alpha = 0.3)

penguins %>% 
  filter(!is.na(sex)) %>% 
  ggplot(aes(x = bill_depth_mm,
             y = body_mass_g,
             color = sex))+
  geom_point(size = 3, alpha = 0.5)+
  facet_wrap(~species)+
  labs(x = 'Bill Depth (mm)',
        y = 'Body Mass (g)',
        color = 'Sex')+
  theme_bw()+
  theme(axis.title = element_text(face = 'italic', size = 14),
        strip.background = element_blank(),
        strip.text = element_text(face = 'bold', size = 14))+
  scale_color_viridis_d(end = 0.8)
  

install.packages("gapminder")
install.packages('ggimage')
installed.packages("gganimate")
install.packages("patchwork")
library(gapminder)
library(ggimage)
library(gganimate)
library(patchwork)

view(gapminder)
gapminder %>% 
  ggplot(aes(x = country,
             y = lifeExp))+
  facet_wrap(~continent)
p1 <- gapminder 

p2 <- p1%>% 
  ggplot(aes(x = year,
             y = lifeExp,
             colour = continent))+
  geom_point(aes(size = pop))+
  facet_wrap(~continent)

p1

ggsave('my_graph.png', plot = p2)


## feb 20
library(gapminder)
library(tidyverse)
library(ggimage)
library(gganimate)
library(patchwork)

df <- gapminder
p3 <- df %>% 
  ggplot(aes(x = gdpPercap,
             y = lifeExp,
             color = continent))+
  geom_point()
df$year %>% range
df$year %>% unique()

p3 + transition_time(time = year)+
  labs(title = 'year')

anim_save('gganimate.gif')

df$country %>% unique()
my_country <- c("China","Japan","Malaysia", "Singapore","Nepal", "Iceland","Uganda","Rwanda")
p5 <- df %>% 
  mutate(my_countries = case_when(country %in% my_country ~ country)) %>%
  ggplot(aes(x = gdpPercap, y = lifeExp, colour = continent))+
  geom_point()+
  geom_text(aes(label = my_countries))
p5 + transition_time(time = year)+
  labs(title = 'Year:{frame_time}')

##
install.packages("ggmap")
library(ggmap)  


##
df <- read.csv('Data/wide_income_rent.csv')
view(df)
df_t <- t(df)
is.data.frame(df_t)
view(df_t)
df_t <- as.data.frame(df_t)
df_t <- df_t[-1,]

df_t$state <- row.names(df_t)
colnames(df_t) <- c('income', 'rent','state')