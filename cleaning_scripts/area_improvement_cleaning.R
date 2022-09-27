# Load in libraries
library(tidyverse)
library(janitor)
library(here)

# Source functions
source(here::here("functions/cleaning_functions.R"))

# Read in data to be cleaned
area_improvement <- read_csv(here::here("raw_data/area_improvement.csv")) %>% 
  clean_names()

# Clean data with cleaning functions
area_improvement_clean <- area_improvement %>% 
  clean_data()

# Pivot data to long format, ready for joining
area_improvement_clean <- pivot_data(area_improvement_clean, 
                                     "local_neighbourhood_improvement")

# Remove feature_code and feature_type
area_improvement_clean  <- area_improvement_clean %>% 
  select(-c(feature_code, feature_type))

# Write clean data to csv
write_csv(area_improvement_clean, "clean_data/area_improvement_clean.csv")
