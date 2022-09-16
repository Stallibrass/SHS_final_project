# These functions should be used in the order they are documented

library(tidyverse)
library(here)

# Renames value to `percent`, filters so CIs are dropped from the data, drops columns with repeated information
clean_data <- function(data){
  data %>% 
    rename(percent = value) %>% 
    filter(measurement == "Percent") %>% 
    select(-c(units, measurement)) 
}

# Load in table to be joined 
features <- read_csv(here::here("raw_data/features.csv"))

# Joins feature data 
add_feature_data <- function(data){
  data %>% 
    left_join(x = data,
              y = features,
              by = "feature_code") %>% 
    relocate(feature_name, .after = feature_code) %>% 
    relocate(feature_type, .after = feature_name)
}

# Pivots the data so all datasets are in the same format
pivot_data <- function(data, col_name){
  data %>% 
    pivot_longer({{col_name}},
                 names_to = "measure",
                 values_to = "response") %>% 
    relocate(measure, .after = date_code) %>% 
    relocate(response, .before = percent)
}