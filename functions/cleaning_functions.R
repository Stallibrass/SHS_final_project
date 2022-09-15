# These functions should be used in the order they are documented

library(tidyverse)
library(here)

clean_data <- function(data){
  data %>% 
    rename(percent = value) %>% 
    filter(measurement == "Percent") %>% 
    select(-c(units, measurement)) 
}

features <- read_csv(here::here("raw_data/features.csv"))

add_feature_data <- function(data){
  data %>% 
    left_join(x = data,
              y = features,
              by = "feature_code") %>% 
    relocate(feature_name, .after = feature_code) %>% 
    relocate(feature_type, .after = feature_name)
}