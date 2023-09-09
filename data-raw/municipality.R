municipality <- jsonlite::read_json(
  "https://github.com/HirMtsd/Code/raw/master/JISX0402/City_list.json",
  simplifyVector = TRUE
)
municipality <- dplyr::as_tibble(municipality$cities) |>
  dplyr::select(!c("en", "remark", "note")) |>
  dplyr::mutate(
    # pref_code = factor(pref_code, labels = zipangu::jpnprefs$prefecture_kanji),
    kana_name = dplyr::as_tibble(kana_name),
    start_date = dplyr::if_else(
      start_date == "0001-01-01",
      lubridate::NA_Date_,
      lubridate::as_date(start_date)
    ),
    end_date = lubridate::as_date(end_date)
  )

usethis::use_data(municipality, overwrite = TRUE)
