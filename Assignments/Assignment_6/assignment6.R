library(tidyverse)
library(janitor)
library(ggplot2)
library(gganimate)

data <- read.csv('Data/BioLog_Plate_Data.csv')
View(data)

# clean names
# create a new col = time, pivot longer
# create a new  col = type (soil or water)

data %>% 
  clean_names()
names(data)
view(data)

time_data <- data %>% 
  pivot_longer(cols = starts_with('Hr_'),
               names_to = 'time',
               values_to = 'abs') %>% 
  mutate(time = as.numeric(str_remove(time, 'Hr_')))
view(time_data)

time_data$Sample.ID %>% unique()
time_data$Dilution %>% unique()

clean_data <- time_data %>% 
  mutate(type = case_when(
    Sample.ID %in% c('Clear_Creek', 'Waste_Water') ~ 'Water',
    TRUE ~ 'Soil'))

dat_plot <- clean_data %>% 
  filter(Dilution == 0.1)

dat_plot %>% 
  ggplot(aes(x = time, y = abs, colour = type))+
  geom_smooth(se = FALSE)+
  facet_wrap(~Substrate)+
  labs(title = 'Just Dilution 0.1',
       x = 'Time',
       y = 'Absorbance',
       color = 'Type')+
  theme_minimal()

ItAcid <- dat_plot %>% 
  filter(Substrate == 'Itaconic Acid')

mean_abs <- ItAcid %>% 
   group_by('Sample ID', Dilution, time) %>% 
   summarise(mean_absorbance = mean(abs),.groups = 'drop')


mean_abs %>% 
  ggplot(aes(x = time, y = mean_absorbance, colour = 'Sample ID'))+
  geom_line()+
  facet_wrap(~ Dilution)+
  labs(x = 'Time',
       y = 'Mean Absorbance',
       color = 'Sample ID')+
  theme_minimal()+
  transition_reveal(time)


