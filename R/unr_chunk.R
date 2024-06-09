unr_chunk <- function(code, name, chunk_opts=list(echo=FALSE)) {
  assert_vector(code)
  assert_string(name)
  assert_list(chunk_opts, null.ok = TRUE)

  ops <- NULL
  if (length(chunk_opts) > 0) {
    ops <- paste0(names(chunk_opts), "=", chunk_opts, collapse = ", ")
    ops <- paste(",", ops)
  }

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
