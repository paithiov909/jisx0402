#' Calc check digits of municipality codes
#'
#' @param code A character vector; municipality codes.
#' @return A character vector.
#' @export
check_digit <- function(code) {
  m <-
    stringi::stri_split_boundaries(
      code,
      type = "character"
    ) |>
    lapply(function(x) {
      k <- sum(as.numeric(x) * c(6, 5, 4, 3, 2))
      if (k < 11) {
        11 - k
      } else {
        (11 - (k %% 11)) %% 10
      }
    }) |>
    unlist() |>
    as.character()
  m
}
