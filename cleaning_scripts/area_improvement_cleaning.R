library(tidyverse)
library(janitor)
library(here)

source(here::here("functions/cleaning_functions.R"))

area_improvement <- read_csv(here::here("raw_data/area_improvement.csv")) %>% 
  clean_names()

area_improvement_clean <- area_improvement %>% 
  clean_data()

write_csv(area_improvement_clean, "clean_data/area_improvement_clean.csv")
