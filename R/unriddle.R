#' Hook function
#'
#' Function that is attached to the [knitr::knit_hooks] object whenever
#' the unriddle parameter is set.
#'
#' @param before Is the code run before or after the chunk?
#' @param options Chunk options
#' @param envir Chunk environment
#' @param name Name of tha parameter (should be unriddle)
#' @param ... Additional params
#'
#' @return None
unriddle <- function(before, options, envir, name, ...) {
  if (!before) {
    input <- unr_chunk(code=options$code,
                       name=options$label)
    output <- lapply(input, function(x) {
      knitr::knit(text=x, envir=envir, quiet=T)
    })
    joined <- paste0(output, collapse = "\n")
    with_js <- unr_add_js(code=joined,
                          name=options$label)
    return(with_js)
  }
}
