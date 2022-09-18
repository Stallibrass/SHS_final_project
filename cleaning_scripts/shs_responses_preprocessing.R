
# Load in libraries
library(tidyverse)
library(janitor)
library(here)
library(missForest)


# Read in data ------------------------------------------------------------

shs_responses <- read_csv(here::here("raw_data/shs_aggregate_responses.csv")) %>% 
  clean_names()


# Clean data --------------------------------------------------------------

# Filter data for entries relating to 1 person
# Drop n_persons column
# Mutate character columns to factor
# Return a data frame for imputation 
shs_responses_factorised <- shs_responses %>% 
  filter(n_persons == 1) %>% 
  select(-n_persons) %>% 
  mutate(across(where(is_character), as_factor)) %>% 
  as.data.frame()

# Impute missing values with missForest
shs_responses_imp <- missForest(shs_responses_factorised)$ximp

# Create tibble
shs_responses_imp <- as_tibble(shs_responses_imp)


# Write data to csv -------------------------------------------------------

write_csv(shs_responses_imp, "clean_data/shs_responses_clean.csv")
