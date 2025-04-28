##march 18/2025

library(tidyverse)
library(skimr)
library(janitor)
library(stringr)
library(readxl)

dat <- read.csv('Data/Bird_Measurements.csv')
View(dat)
##clean bird measurement data 
#keep; family, species number, species name, English name,clutch size, egg masss, mating system

keep = c("Family", "Species_number", "Species_name", "English_name", "Clutch_size", "Egg_mass", "Mating_System")


male <- dat %>% 
  select(keep,starts_with("M_"), -ends_with('_N')) %>% 
  mutate(sex = 'male')

names(male) <- names(male) %>%  str_remove("M_")
 
female <- dat %>% 
  select(keep,starts_with("F_"), -ends_with('_N')) %>% 
  mutate(sex = 'female')

names(female) <- names(female) %>%  str_remove("F_")

unsexed <- dat %>% 
  select(keep,starts_with("Unsexed_"), -ends_with('_N')) %>% 
  mutate(sex = 'unsexed')

names(unsexed) <- names(unsexed) %>%  str_remove("unsexed_")
names(unsexed) <- names(unsexed) %>%  str_remove("Unsexed_")


join_dat <- full_join(male, female)
join_dat2 <- full_join(join_dat, unsexed)
view(join_dat2)

clean_dat <-
  male %>% 
  full_join(female) %>% 
  full_join(unsexed)
view(clean_dat)

identical(names(male), names(female))
identical(letters[1:3], c('a', 'b', 'c'))





#march 20

install.packages('measurements')
library(measurements)
library(readxl)
dat <- read_xlsx('Data/height.xlsx')

dat_2 <- dat %>% 
  pivot_longer(everything(),
               names_to = 'sex',
               values_to = 'height') %>% 
  separate(height, into = c('feet', 'inches'), convert = T) %>% 
  mutate(inches_all = ())
