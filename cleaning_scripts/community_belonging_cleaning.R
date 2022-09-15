library(tidyverse)
library(janitor)
library(here)

source(here::here("functions/cleaning_functions.R"))

community_belonging <- read_csv(here::here("raw_data/community_belonging.csv")) %>% 
  clean_names()

community_belonging_clean <- community_belonging %>% 
  clean_data() %>% 
  add_feature_data()

write_csv(community_belonging_clean, "clean_data/community_belonging_clean.csv")
