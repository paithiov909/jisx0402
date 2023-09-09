jpprefs <- jsonlite::read_json(
  "https://github.com/HirMtsd/Code/raw/master/JISX0401/Prefecture_list.json",
  simplifyVector = TRUE
)
jpprefs <- jpprefs$prefectures |>
  dplyr::rename(
    pref_code = code
  ) |>
  dplyr::select(pref_code, name) |>
  dplyr::as_tibble()

usethis::use_data(jpprefs, overwrite = TRUE)
