# Load in libraries
library(tidyverse)
library(janitor)
library(here)

# Source functions
source(here::here("functions/cleaning_functions.R"))

# Read in data to be cleaned
community_belonging <- read_csv(here::here("raw_data/community_belonging.csv")) %>% 
  clean_names()

# Clean data with cleaning functions
community_belonging_clean <- community_belonging %>% 
  clean_data() %>% 
  add_feature_data()

# Pivot ready for joining
community_belonging_clean <- pivot_data(community_belonging_clean, "community_belonging")

# Write clean data to csv
write_csv(community_belonging_clean, "clean_data/community_belonging_clean.csv")
