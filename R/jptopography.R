#' Topographic data of Japanese municipalities
#'
#' Reads 'FlatGeobuf' file and returns topographic data as an `sf` object.
#'
#' @details
#' This package contains several 'FlatGeobuf' files converted
#' from the 'GeoJSON' files of \href{https://github.com/smartnews-smri/japan-topography}{smartnews-smri/japan-topography}.
#' The original 'GeoJSON' files are sourced from
#' \href{https://nlftp.mlit.go.jp/ksj/}{MLIT of Japan site}.
#' Therefore, to use these dataset,
#' you must agree to their \href{https://nlftp.mlit.go.jp/ksj/other/agreement.html}{term of use}.
#'
#' @param type String; One of `all`, `desiginated`, or `prefecture`.
#' @param resolution String; One of `low` or `high`.
#' If `high`, returns the 1% dissolved data ('s0010').
#' Otherwise, returns the 0.1% dissolved data ('s0001').
#' @return An `sf` object from the 'sf' package.
#' @export
jptopography <- function(type = c("all", "designated", "prefecture"),
                         resolution = c("low", "high")) {
  rlang::check_installed(
    "sf",
    reason = "requires `sf` package to read FlatGeobuf file!"
  )
  type <- rlang::arg_match(type)
  if (is.numeric(resolution)) {
    resolution <- ifelse(resolution >= 1, "high", "low")
  }
  resolution <- rlang::arg_match(resolution, values = c("high", "low"))

  eval(rlang::call2(
    "read_sf",
    !!!list(
      dsn = system.file(
        paste0(file.path("extdata", ifelse(resolution == "low", "s0001", "s0010"), type), ".fgb"),
        package = "jisx0402"
      )
    ),
    .ns = "sf"
  ))
}
