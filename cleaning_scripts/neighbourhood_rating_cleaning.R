# Load in libraries
library(tidyverse)
library(janitor)
library(here)

# Source functions
source(here::here("functions/cleaning_functions.R"))

# Read in data to be cleaned
neighbourhood_rating <- read_csv(here::here("raw_data/neighbourhood_rating.csv")) %>% 
  clean_names()

# Clean data with cleaning functions and drop feature_code
neighbourhood_rating_clean <- neighbourhood_rating %>% 
  clean_data() %>% 
  add_feature_data() %>% 
  select(-feature_code)

# Pivot ready for joining
neighbourhood_rating_clean <- pivot_data(neighbourhood_rating_clean, 
                                         "neighbourhood_rating")

# Write clean data to csv
write_csv(neighbourhood_rating_clean, "clean_data/neighbourhood_rating_clean.csv")
