#### Acquire ####
toronto_shelters <-
  # Each package is associated with a unique id  found in the "For 
  # Developers" tab of the relevant page from Open Data Toronto
  # https://open.toronto.ca/dataset/daily-shelter-overnight-service-occupancy-capacity/
  list_package_resources("21c83b32-d5a8-4106-a54f-010dbe49f6f2") |>
  # Within that package, I am interested in the 2022 dataset
  filter(name == 
           "daily-shelter-overnight-service-occupancy-capacity-2022.csv") |>
  # Having reduced the dataset to one row we can get the resource
  get_resource()

write_csv(
  x = toronto_shelters,
  file = "inputs/data/unedited_data.csv"
)

head(toronto_shelters)



toronto_shelters_clean2 <-
  clean_names(toronto_shelters) |>
  mutate(occupancy_date = ymd(occupancy_date)) |> 
  select(occupancy_date, occupied_beds)

head(toronto_shelters_clean2)


write_csv(
  x = toronto_shelters_clean,
  file = "inputs/data/cleaned_data.csv"
)
