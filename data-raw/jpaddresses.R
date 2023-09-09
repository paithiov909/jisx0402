## code to prepare `jpaddresses` dataset goes here
## `jpaddresses` originally comes
## from 'https://github.com/geolonia/japanese-addresses/raw/develop/data/latest.csv'
## which is licensed under the CC BY 4.0
jpaddresses <-
  readr::read_csv(
    "https://github.com/geolonia/japanese-addresses/raw/master/data/latest.csv",
    col_names = c(
      "pref_code",
      "pref_name",
      "pref_name_kana",
      "pref_name_en",
      "muni_code", # "city_code"
      "city_name",
      "city_name_kana",
      "city_name_en",
      "address_name",
      "address_name_kana",
      "address_name_en",
      "address_koaza",
      "longitude",
      "latitude"
    ),
    skip = 1
  ) |>
  dplyr::select(
    muni_code,
    address_name,
    address_name_kana,
    address_name_en,
    longitude,
    latitude
  ) |>
  dplyr::as_tibble()

usethis::use_data(jpaddresses, overwrite = TRUE)
