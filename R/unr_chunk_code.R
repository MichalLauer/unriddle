#' Clean parts of chunk code
#'
#' In a vector of code lines, remove all breaks. In the last line, all
#' pipes are removed as well.
#'
#' @param code Lines of code to clean
#' @param separator Separator that is used to separate slides
#' @param pipes Pipes to remove from the last row
#'
#' @return Cleaned vector of code
unr_chunk_code <- function(code, separator = "#break",
                           pipes = c("|>", "%>%", "+")) {
  assert_character(code)
  assert_string(separator)
  assert_character(pipes)

  # Remove all breaks within the code
  regex <- paste0("\\s*", separator,"\\s*$")
  clean <- gsub(regex, "", code)

  # Remove all pipes in the last line
  pipes <- escape_regex(pipes)
  regex <- paste0("\\s*(", paste0(pipes, collapse = "|"), ")\\s*$")
  clean[length(clean)] <- gsub(regex, "", clean[length(clean)])

  return(clean)
}
