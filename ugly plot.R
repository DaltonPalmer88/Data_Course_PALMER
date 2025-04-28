##Ugly plot

semester <- data.frame(#example
  Week = c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12),
  Stress = c(5, 18, 35, 48, 63, 78, 61, 65, 69, 81, 88, 97))
view(semester)
library(ggplot2)
library(png)
library(grid)
library(dplyr)

img <- readPNG('stressed_girl_pic_2.png') 
str(semester)
head(semester)
semester <- semester %>% ungroup()

semester %>% 
  ggplot(aes(x = Week,
             y = Stress))+
  annotation_raster(img, xmin = -Inf, xmax = Inf, ymin = -Inf, ymax = Inf)+
  geom_point(size = 2, color = "darkred")+
  labs(title = "My Semester Stress levels",
       caption = "Source: My lived experience")+
  theme(axis.text.x = element_text(angle = 117, color = 'purple'),
        axis.text.y = element_text(angle = -133, color = 'turquoise'),
        axis.title.x = element_text(angle = -77,  color = 'orange'),
        axis.title.y = element_text(angle = 113, color = 'lightgreen'),
        plot.background = element_rect(fill = 'brown'))
ggsave('semester.png')
  
  