library(tidyverse)
library(janitor)
library(here)

source(here::here("functions/cleaning_functions.R"))

neighbourhood_involvement <- read_csv(here::here("raw_data/neighbourhood_involvement.csv")) %>% 
  clean_names()

neighbourhood_involvement_clean <- neighbourhood_involvement %>% 
  clean_data() 

write_csv(neighbourhood_involvement_clean, "clean_data/neighbourhood_involvement_clean.csv")