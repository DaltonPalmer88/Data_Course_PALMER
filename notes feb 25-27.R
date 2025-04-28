##notes feb 25th

library(ggmap)
install.packages("leaflet")
library(leaflet)
library(tidyverse)

leaflet() %>% 
  addTiles() %>% 
  addMarkers(lng = -9.14, lat = 38.7)


##
dat_ex <- data.frame(#example
  ID = c(1,2,3,4),
  Weight = c(78, 88, 100, 155),
  Height = c(167, 180, 155, 155))
  
View(dat_ex) 
dat_ex %>%  
  pivot_longer(cols = everything(),
               names_to = 'measurment',
               values_to = 'value') %>%
  View()
dat_long <- dat_ex %>% 
  ###missing steps. look at notes
  
  
##
df <- read.csv('Data/wide_income_rent.csv')
view(df)

df %>% 
  pivot_longer(cols = -variable,
               names_to = 'State',
               values_to = 'value') %>% 
  pivot_wider(names_from = 'variable',
              values_from = 'value') %>% 
  View()

table2 %>% 
  pivot_wider(names_from = 'type',
              values_from = 'count')
table3 %>% 
  separate(rate, c('col1','col2'))

###feb 27

library(tidyverse)
library(leaflet)
##make table 4a and 4b tidy like table 1

table1
table4a  
table4b
merged_data <- full_join(table4a, table4b, by = c('country', '1999', '2000')) %>% 
  pivot_longer(-country,
               names_to = 'year',
               values_to = 'cases') %>% 
  view()
x<- table4a %>% 
  pivot_longer(-country,
               names_to = 'year',
               values_to = 'cases')
y <- table4b %>% pivot_longer(-country,
                              names_to = 'year',
                              values_to = 'population')
table4tidy <- full_join(x,y)
view(table4tidy)

## make table 5 tidy

paste0(table5$century,table5$year)
paste0(table5$year,table5$century)
paste0(table5$year,table5$century, 'i')
view(table5)
table5.0 <- table5 %>%
  separate(rate, c('cases','population'),convert = TRUE) %>% 
  mutate(year = paste0(table5$century,table5$year)) %>%
  select(-century)
table5.0

##entering data to excel
##path: /Exercise/Data_Entry_Case_Study.txt
getwd()
###march 4th
library(readxl)
dat <- read_xlsx('Data/messy_bp.xlsx',skip = 3) %>% 
  view()
bp <- dat %>% 
  select(-starts_with('HR')) %>% view()
bp <- bp %>% 
  pivot_longer(starts_with('BP'),
               names_to = 'Visit',
               values_to = 'bp') %>% 
  mutate(Visit = case_when(Visit == 'BP...8' ~1,
                           Visit == 'BP...10' ~2,
                           Visit == 'BP...12' ~3)) %>%
  separate(bp, into = c('systolic', 'diatolic')) %>% 
    view()
  
  
hr <- dat %>% 
  select(-starts_with('BP')) %>% 
  view()
hr <- hr %>% 
  pivot_longer(starts_with('HR'),
               names_to = 'Visit',
               values_to = 'hr') %>% 
  mutate(Visit = case_when(Visit == 'HR...9' ~1,
                           Visit == 'HR...11' ~2,
                           Visit == 'HR...13' ~3)) %>% 
  View()
 
dat_join <- full_join(bp, hr)
view(dat_join)

## 3/6
library(readxl)
library(tidyverse)
install.packages('janitor')
library(janitor)
library(dplyr)


dat <- read_xlsx('Data/messy_bp.xlsx', skip = 3)
View(dat)

for (i in 2:nrow(pat_dat)) {
  if(pat_dat$pat_id[i] == pat_dat$pat_id[i-1]) {
    pat_dat$pat_id[i] <- pat_dat$pat[i] + 1
  }
}

duplicated()
id <- c(1, 3, 3, 4, 5)
duplicated(id)

dat %>% 
  mutate(id_fix = pat_id + cumsum(duplicated(pat_id))) %>% 
  View()

bp <- dat %>% 
  
dat %>% 
  arrange('Year birth') %>% 
  View()

dat_join %>% 
  mutate(Race_new = case_when(Race == 'Caucasian' ~ 'White',
                              Race == 'WHITE' ~ 'White',
                              TRUE ~ Race)) %>%
  mutate(systolic = as.numeric(systolic),
         diatolic = as.numeric(diatolic)) %>%
  mutate(birthday = paste(`Year birth`, `Month of birth`, `Day birth`, sep = '-')) %>% 
  select(-`Year birth`, -`Month of birth`, `Day birth`)

  