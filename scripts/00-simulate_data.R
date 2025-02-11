#### Preamble ####
# Purpose: Get data on the Daily Shelter & Overnight Service Occupancy & Capacity in Toronto
# Author: Jerry Lu (Yen-CHia Lu)
# Email: Jerry33692@gmail.com or Jerryyenchia.lu@mail.utoronto.ca
# Date: 23 Jan 2024
# Prerequisites: -

#### Workspace setup ####
install.packages("opendatatoronto")
install.packages("knitr")
install.packages("tidyverse")

library(knitr)
library(opendatatoronto)
library(tidyverse)

#### Simulate ####
set.seed(1300)

simulated_Shelter_service_data <-
  tibble(
    date = rep(x = as.Date("2023-01-01") + c(0:364), times = 3),
    # Based on Eddelbuettel: https://stackoverflow.com/a/21502386
    shelter = c(
      rep(x = "Service_user 1", times = 365),
      rep(x = "Service_user 2", times = 365),
      rep(x = "Service_user 3", times = 365)
    ),
    number_service_user =
      rpois(
        n = 365 * 3,
        lambda = 100
      ) # Draw 1,095 times from the Poisson distribution
  )

head(simulated_Shelter_service_data)
