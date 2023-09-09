# Read geojson files from 'https://github.com/smartnews-smri/japan-topography'
# and save as '.gpkg' files.
url <-
  paste0(
    "https://github.com/smartnews-smri/japan-topography/raw/main/data/municipality/geojson",
    c("/s0001", "/s0010")
  ) |>
  purrr::map(~ paste0(., c("/N03-21_210101.json", "/N03-21_210101_designated_city.json", "/prefectures.json"))) |>
  unlist()

dest <-
  paste0(
    "inst/extdata",
    c("/s0001", "/s0010")
  ) |>
  purrr::map(~ paste0(., c("/all", "/designated", "/prefecture"), ".fgb")) |>
  unlist()

purrr::walk(seq_len(6), \(x) {
  if (x %in% c(3, 6)) {
    obj <- sf::read_sf(url[x]) |>
      dplyr::mutate(
        pref_code = jpcity::parse_pref(`N03_001`) |>
          jpcity::pref_code() |>
          as.character() |>
          stringi::stri_pad_left(width = 2, pad = "0")
      ) |>
      dplyr::select(pref_code)
  } else {
    obj <- sf::read_sf(url[x]) |>
      dplyr::rename(muni_code = `N03_007`) |>
      dplyr::select(muni_code)
  }
  sf::write_sf(obj, dsn = here::here(dest[x]))
})
