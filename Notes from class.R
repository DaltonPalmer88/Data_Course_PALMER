C:\Users\Owner\Data_Course_PALMER
df_rent_by_state
head(df_rent_by_state, n = 1)

data("mtcars")
mtcars
datasets::mtcars
View(mtcars)
data = mtcars
data[data$mpg > 20 & data$cyl ==4,]

dim(mpg20_cyl_14)
library(tidyverse)
##1 
datasets::mtcars
view(mtcars)
data = mtcars
## find wt greater than 3 and 8cyl, and save as new object
data_test = data[data$wt > 3 & data$cyl ==8,]
##2
## calculate average mpg of new object

?mean
mean(data_test$mpg)
##3
##create a numeric vector object named hp.cyl, calculated by dividing hp by cyl

names(data_test)
data_test$hp.cyl <- data_test$hp/data_test$cyl
names(data_test)
##4
#save this as a .csv file on laptop and open it 
write.csv(data_test, 'test_car.csv')


library(tidyverse)

mtcars %>%
  filter(wt > 3 & cyl == 8) %>%
  mutate(hp.cyl = hp/cyl) %>%
  write.csv( 'test.csv')

mean(mtcars$mpg) #opt1
mtcars$mpg %>% #pipe
  mean()
install.packages('palmerpenguins')
library(palmerpenguins)
penguins
view(penguins)

penguins %>%
  names()
names(penguins)

dat_bill <- penguins %>%
  filter(bill_length_mm > 40)

penguins %>%
  filter(bill_length_mm > 40 & sex == 'female')

mean(dat_bill$body_mass_g) mean()

penguins %>%
  filter(bill_length_mm > 40 & sex == 'female') %>%
  pluck('body_mass_g') %>%
  mean()
penguins %>%
  filter(bill_length_mm > 40 & sex == 'female') %>%
  group_by(species) %>%
  summarise(body_mass_g = mean(body_mass_g))

new_file = penguins %>%
  filter(bill_length_mm > 40 & sex == 'female') %>%
  group_by(island) %>%
  summarise(mean_body_mass = mean(body_mass_g),
            max_body_mass = max(body_mass_g),
            count = n())
  
write.csv(new_file, 'penguins_1.csv')



#february 4

## 1 find fattie penguins (> 500)

library(tidyverse)
library(palmerpenguins)
View(penguins)
penguins%>%
  filter(body_mass_g > 5000) 
## 2 count how many are male and how many are female
penguins %>% 
  filter(body_mass_g > 5000) %>% 
  group_by(sex) %>% 
  summarise(count = n())

##3 return max body mass for male and female
penguins %>% 
  filter(body_mass_g > 5000) %>% 
  group_by(sex) %>% 
  summarise(count = n(),
            fattest = max(body_mass_g),
            skinny_among_fatties = min(body_mass_g))

max(penguins$body_mass_g, na.rm = T)

penguins$body_mass_g %>% 
  max(na.rm = T)

## 4 add new column to penguins to dataset that says whether they are fat

dat_peng <- peguins

dat_peng$fat_state <- dat_peng$body_mass_g > 5000
view(dat_peng)

penguins %>% 
  mutate(fat_or_not = case_when(body_mass_g > 5000 ~ 'fat',
                                body_mass_g <= 5000 & body_mass_g > 3000 ~ 'medium',
                                body_mass_g <= 3000 ~ 'skinny',
                                TRUE ~ 'NA')) %>% 
  view()
## if condition is true 
dat_peng <- penguins %>% 
  mutate(fat_or_not = case_when(body_mass_g > 5000 ~ 'fat',
                                body_mass_g <= 5000 & body_mass_g > 3000 ~ 'medium',
                                body_mass_g <= 3000 ~ 'skinny',
                                TRUE ~ 'NA')) 
plot(dat_peng$bill_length_mm, dat_peng$body_mass_g) %>% 
library(ggplot2)
dat_peng %>% 
  filter(!is.na(sex)) %>% 
  ggplot(aes(x = bill_length_mm,
             y = body_mass_g,
             colour = sex)) +
  geom_point()

#aes = aesthetic



## february 6 

penguins %>% 
  names()

bad_dat <- penguins %>% 
  mutate(yearr = year + 20) %>% 
  View()






  