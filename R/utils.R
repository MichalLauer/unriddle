#' Escape regex special characters
#'
#' Function that takes any pattern and escapes special characters so
#' they can be used in regex as a regular symbols
#'
#' @param pattern Pattern(s) to escape
#'
#' @return Escaped pattern(s)
escape_regex <- function(pattern) {
  assert_character(pattern)
  gsub("([][{}()^$.|?*+\\])", "\\\\\\1", pattern)
}
