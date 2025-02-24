#exam 1 notes


# YOUR TASKS:

**I.**
  **Read the cleaned_covid_data.csv file into an R data frame. (20 pts)**
library(tidyverse)
covid <- read.csv("cleaned_covid_data.csv")
view(covid)
nrow(covid)
  
  **II.**
  **Subset the data set to just show states that begin with "A" and save this as an object called A_states. (20 pts)**
Astates <- covid %>% 
  filter(Province_State %in% c("Alabama","Alaska","Arizona","Arkansas"))
view(Astates)
  
  + Use the *tidyverse* suite of packages
+ Selecting rows where the state starts with "A" is tricky (you can use the grepl() function or just a vector of those states if you prefer)

**III.**
  **Create a plot _of that subset_ showing Deaths over time, with a separate facet for each state. (20 pts)**
Astates %>% 
  ggplot(aes(x = Last_Update,
             y = Deaths))+
  geom_point()+
  geom_smooth(method = "loess", se = FALSE)+
  facet_wrap(~Province_State, scales = 'free')


  + Create a scatterplot
+ Add loess curves WITHOUT standard error shading
+ Keep scales "free" in each facet

**IV.** (Back to the full dataset)
**Find the "peak" of Case_Fatality_Ratio for each state and save this as a new data frame object called state_max_fatality_rate. (20 pts)**

state_max_fatality_rate <-covid %>% 
  filter(!is.na(Case_Fatality_Ratio)) %>% 
 group_by(Province_State) %>% 
  summarise(peak_CFR = max(Case_Fatality_Ratio, na.rm = TRUE)) %>% 
  arrange(desc(peak_CFR))
view(state_max_fatality_rate)
  
**V.**
state_max_fatality_rate %>% 
  ggplot(aes(x = Province_State, y = peak_CFR))+
  geom_bar(stat = "identity", fill = "lavender")+
  theme(axis.text.x = element_text(angle = 90))

**VI**
library(dplyr)
covid_deaths <- covid %>%
  group_by(Last_Update) %>% 
  summarise(cumulative_death = sum(Deaths, na.rm = TRUE)) %>% 
  arrange(Last_Update)
covid_deaths %>% 
  ggplot(aes(x = Last_Update, y = cumulative_death))+
  geom_bar(stat = 'identity',color = 'blue')+
  labs(title = 'US cumulative deaths over time',
       x = 'Date', y= 'Cumulative deaths')+
  theme_minimal()
  
  