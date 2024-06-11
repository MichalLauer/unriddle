#' Style individual slides
#'
#' Used to style individual styles (children of the main chunk).
#'
#' @param options Chunk options
#'
#' @return Vector of javascript code
unr_code_options_child <- function(options) {
  assert_list(options)

  jscode <- NULL

  # Set the height of code block so it is fixed for the code and does not
  # stretch for all chunks.
  if (!is.null(options[["unriddle-code-height"]]) &&
      options[["unriddle-code-height"]] == "fixed") {
    jscode <- append(
      jscode,
      "child.querySelector('.sourceCode').style.height = 'fit-content'")
  }


  return(jscode)
}
