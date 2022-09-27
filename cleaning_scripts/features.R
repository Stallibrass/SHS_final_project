# Load in libraries
library(tidyverse)
library(janitor)
library(here)

# Read in data 
area_improvement <- read_csv(here::here("raw_data/area_improvement.csv")) %>% 
  clean_names()

glimpse(area_improvement)

# Create new table with just the feature_name column
features <- area_improvement %>% 
  select(starts_with("feature_")) %>% 
  select(-feature_type) %>% 
  unique()

glimpse(features)

# Writes data to csv
write_csv(features, "raw_data/features.csv")
          