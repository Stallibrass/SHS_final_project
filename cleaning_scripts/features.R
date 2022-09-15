library(tidyverse)
library(janitor)
library(here)

area_improvement <- read_csv(here::here("raw_data/area_improvement.csv")) %>% 
  clean_names()

glimpse(area_improvement)

features <- area_improvement %>% 
  select(starts_with("feature")) %>% 
  unique()

glimpse(features)

write_csv(features, "raw_data/features.csv")
          