
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
shs_responses_clean <- shs_responses %>% 
  filter(n_persons == 1) %>% 
  select(-n_persons) %>% 
  mutate(distance_to_nearest_green_space = recode(distance_to_nearest_green_space, # change to be less verbose
                                                  "A 5 minute walk or less" = "Less than 5 minutes",
                                                  "More than a 30 minute walk away" = "More than 30 minutes",
                                                  "Within a 21-30 minute walk" = "Between 21 and 30 minutes",
                                                  "Within a 6-10 minute walk" = "Between 6 and 10 minutes",
                                                  "Within an 11-20 minute walk" = "Between 11 and 20 minutes")) %>% 
  mutate(satisfaction_with_nearest_green_space = recode(satisfaction_with_nearest_green_space, 
                                                        "Neither satisfied nor dissatisfied" = "No opinion")) %>% # equivalent
  mutate(nearest_green_space_use = recode(nearest_green_space_use,
                                          "Less often" = "Don't know")) # equivalent


shs_responses_factorised = shs_responses_clean %>% 
  mutate(across(where(is_character), as_factor)) %>% 
  as.data.frame()

# Impute missing values with missForest
shs_responses_imp <- missForest(shs_responses_factorised)$ximp

# Create tibble
shs_responses_imp <- as_tibble(shs_responses_imp)


# Write data to csv -------------------------------------------------------

write_csv(shs_responses_imp, "clean_data/shs_responses_clean.csv")
