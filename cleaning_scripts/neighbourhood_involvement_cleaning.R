# Load in libraries
library(tidyverse)
library(janitor)
library(here)

# Source functions
source(here::here("functions/cleaning_functions.R"))

# Read in data to be cleaned
neighbourhood_involvement <- read_csv(here::here("raw_data/neighbourhood_involvement.csv")) %>% 
  clean_names()

# Clean data with cleaning functions
neighbourhood_involvement_clean <- neighbourhood_involvement %>% 
  clean_data() 

# Pivot data to long format, ready for joining
neighbourhood_involvement_clean <- pivot_data(neighbourhood_involvement_clean,
                                              "involvement_with_people_in_the_neighbourhood")

# Write clean data to csv
write_csv(neighbourhood_involvement_clean, "clean_data/neighbourhood_involvement_clean.csv")
