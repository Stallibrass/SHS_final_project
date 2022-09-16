# Load in libraries
library(tidyverse)
library(here)

# Read in cleaned data

area_improvement <- read_csv(here::here("clean_data/area_improvement_clean.csv"))
community_belonging <- read_csv(here::here("clean_data/community_belonging_clean.csv"))
green_spaces <- read_csv(here::here("clean_data/green_spaces_clean.csv"))
neighbourhood_involvement <- read_csv(here::here("clean_data/neighbourhood_involvement_clean.csv"))
neighbourhood_rating <- read_csv(here::here("clean_data/neighbourhood_rating_clean.csv"))

# Join data with bind_rows

shs_data <- bind_rows(
  area_improvement,
  community_belonging,
  green_spaces,
  neighbourhood_involvement,
  neighbourhood_rating
)


# Write data to csv
write_csv(shs_data, "clean_data/shs_data.csv")
