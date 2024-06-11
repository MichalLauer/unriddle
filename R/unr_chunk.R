#' Unriddle a single chunk
#'
#' Given a vector of code lines, return a list where each item represents the
#' formatted code using [unr_chunk_code] split by #break. Parameters
#' **echo=TRUE** and **output-location: column** are also appended.
#'
#' @param code Vector of codes
#' @param name Name of the caller
#'
#' @return List of formatted code chunks
unr_chunk <- function(code, name) {
  assert_character(code)
  assert_string(name)

  footer <- "```\n"
  id <- 0
  chunks <- lapply(X = seq_along(code), FUN = function(i) {
    if (!grepl("#break\\s*$", code[i]) & i != length(code)) return(NULL)
    id <<- id + 1
    header <- paste0("\n```{r ", name, "-", id, "}")
    header <- paste0(header, "\n#| output-location: column")
    header <- paste0(header, "\n#| echo: true")
    body <- unr_chunk_code(code[seq_len(i)])
    chunk <- paste0(c(header, body, footer), collapse = "\n")
    return(chunk)
  })
  content <- Filter(Negate(is.null), chunks)
  return(content)
}
