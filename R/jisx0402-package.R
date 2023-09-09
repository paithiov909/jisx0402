#' Datasets Related to 'JIS X 0402:2020'
#' @import tibble
#' @keywords internal
"_PACKAGE"

#' Municipality codes of Japan
#'
#' A list of Japanese municipalities and their codes,
#' as known as the 'Zenkoku Chiho-kokyo-dantai Code'.
#' You can use a concatnated string like: \code{paste0(pref_code, city_code)}
#' as an actual municipality code.
#'
#' @details
#' The 'Zenkoku Chiho-kokyo-dantai Code' is a combination
#' of a prefecture code defined in 'JIS X 0401'
#' and a municipality code (city, ward, town or village code) defined in 'JIS X 0402'.
#'
#' These codes consists of 5 to 6 digits.
#' The 6th digit is optional; that is a check digit.
#' Of the remaining numbers, the first 2 digits are the prefecture code
#' and the last 3 digits are the municipality code.
#'
#' '000' as a municipality code means prefecture itself.
#' For example, '010006' is a hybrid of '01' ('pref_code' of Hokkaido),
#' '000', and its check digit '6'.
#'
#' @seealso \url{https://www.soumu.go.jp/denshijiti/code.html}
"municipality"

#' Japanese addresses and their coordinates
#'
#' Modified from the 'latest.csv' file
#' in \href{https://github.com/geolonia/japanese-addresses/}{japanese-addresses}.
#' The original dataset is licensed under \href{https://creativecommons.org/licenses/by/4.0/deed.ja}{CC BY 4.0}.
#'
#' @source \url{https://github.com/geolonia/japanese-addresses/raw/develop/data/latest.csv}
"jpaddresses"

#' Prefecture codes of Japan
"jpprefs"
