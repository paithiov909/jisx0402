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
#' @param resolution Numeric; If smaller than `1`,
#' returns the 0.1% desolved data ('s0001').
#' Otherwise, returns the 1% desolved data ('s0010').
#' @return An `sf` object from the 'sf' package.
#' @export
jptopography <- function(type = c("all", "designated", "prefecture"),
                         resolution = .1) {
  rlang::check_installed(
    "sf",
    reason = "requires `sf` package to read FlatGeobuf file!"
  )
  type <- rlang::arg_match(type)

  eval(rlang::call2(
    "read_sf",
    !!!list(
      dsn = system.file(
        paste0(file.path("extdata", ifelse(resolution < 1, "s0001", "s0010"), type), ".fgb"),
        package = "jisx0402"
      )
    ),
    .ns = "sf"
  ))
}
