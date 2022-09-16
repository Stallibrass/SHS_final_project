library(tidyverse)
library(janitor)
library(here)
library(readxl)

national_performance_framework <- read_xlsx(here::here("raw_data/npf_database.xlsx")) %>% 
  clean_names()

npf_shs_communities <- national_performance_framework %>% 
  filter(outcome == "Communities" &
         source == "Scottish Household Survey")

npf_shs_communities <- npf_shs_communities %>% 
  select(-c(characteristic,
            source,
            outcome)) %>% 
  mutate(measure = recode(measure, 
                          "Proportion of adults who live within a 5 minute walk of their local green or blue space" = 
                          "Proportion of adults living within 5 minutes' walk of their nearest green or blue space")) 
        

write_csv(npf_shs_communities, "clean_data/npf_shs_communities.csv")
