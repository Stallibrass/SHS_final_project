library(tidyverse)
library(janitor)
library(here)

source(here::here("functions/cleaning_functions.R"))

neighbourhood_rating <- read_csv(here::here("raw_data/neighbourhood_rating.csv")) %>% 
  clean_names()

neighbourhood_rating_clean <- neighbourhood_rating %>% 
  clean_data() %>% 
  add_feature_data()

write_csv(neighbourhood_rating_clean, "clean_data/neighbourhood_rating_clean.csv")