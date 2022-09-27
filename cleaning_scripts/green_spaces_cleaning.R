# Load in libraries
library(tidyverse)
library(janitor)
library(here)

# Source functions
source(here::here("functions/cleaning_functions.R"))

# Read in data to be cleaned
green_spaces <- read_csv(here::here("raw_data/green_spaces.csv")) %>% 
  clean_names()

# Clean data with cleaning functions and drop feature_code
green_spaces_clean <- green_spaces %>% 
  clean_data() %>% 
  add_feature_data() %>% 
  select(-c(feature_code, age)) # age isn't shared with any of the other datasets

# Clean data with cleaning functions
green_spaces_clean <- pivot_data(green_spaces_clean, 
                                 "distance_to_nearest_green_or_blue_space")

# Write clean data to csv
write_csv(green_spaces_clean, "clean_data/green_spaces_clean.csv")
