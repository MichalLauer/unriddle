escape_regex <- function(pattern) {
  gsub("([][{}()^$.|?*+\\])", "\\\\\\1", pattern)
}
