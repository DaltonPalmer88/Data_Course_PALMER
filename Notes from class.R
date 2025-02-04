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

