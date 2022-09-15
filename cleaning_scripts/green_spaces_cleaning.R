library(tidyverse)
library(janitor)
library(here)

source(here::here("functions/cleaning_functions.R"))

green_spaces <- read_csv(here::here("raw_data/green_spaces.csv")) %>% 
  clean_names()

green_spaces_clean <- green_spaces %>% 
  clean_data() %>% 
  add_feature_data()

write_csv(green_spaces_clean, "clean_data/green_spaces_clean.csv")