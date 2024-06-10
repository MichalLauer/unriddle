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
