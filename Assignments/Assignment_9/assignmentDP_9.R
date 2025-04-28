library(tidyverse)
library(ggplot2)
library(readxl)
library(measurements)
library(janitor)
library(caret)
library(dplyr)


Wet1 <- read.csv('../Assignment_9/chart (1).csv')
Wet2 <- read.csv('../Assignment_9/chart (2).csv')
Wet3 <- read.csv('../Assignment_9/chart (3).csv')
Wet4 <- read.csv('../Assignment_9/chart (4).csv')
Wet5 <- read.csv('../Assignment_9/chart (5).csv')
Wet6 <- read.csv('../Assignment_9/chart (6).csv')
Wet7 <- read.csv('../Assignment_9/chart (7).csv')
Wet8 <- read.csv('../Assignment_9/chart (8).csv')

View(Wet1)

allwet <-rbind(Wet1, Wet2, Wet3, Wet4, Wet5, Wet6, Wet7, Wet8)

View(allwet)
nrow(allwet)

















