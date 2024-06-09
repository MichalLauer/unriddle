unr_chunk_code <- function(lines, separator = "#break",
                           pipes = c("|>", "%>%", "+")) {
  assert_vector(lines)
  assert_string(separator)

  regex <- paste0("\\s*", separator,"\\s*$")
  clean <- gsub(regex, "", lines)

  pipes <- escape_regex(pipes)
  regex <- paste0("\\s*(", paste0(pipes, collapse = "|"), ")\\s*$")
  clean[length(clean)] <- gsub(regex, "", clean[length(clean)])

  return(clean)
}
