library(tidyverse)
library(janitor)
library(here)
library(readxl)

national_performance_framework <- read_xlsx(here::here("raw_data/npf_database.xlsx")) %>% 
  clean_names()

npf_shs_communities <- national_performance_framework %>% 
  filter(outcome == "Communities" &
         source == "Scottish Household Survey")


write_csv(npf_shs_communities, "clean_data/nps_shs.csv")
