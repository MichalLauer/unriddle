#' @export
unriddle <- function(enable) {
  if (enable) {
    unriddle_fun <- unriddle_enable
  } else {
    unriddle_fun <- unriddle_disable
  }

  knitr::knit_hooks$set(unriddle = unriddle_fun)
}

unriddle_disable <- function(before, options, envir, name, ...) {
  print("Vypnuto !!!!")
  return("-VYPNUTO--")
}

unriddle_enable <- function(before, options, envir, name, ...) {
  if (before) {

  } else {
    input <- unr_chunk(code=options$code,
                       name=options$label)
    output <- lapply(input, function(x) {
      knitr::knit(text=x, envir=envir, quiet=T)
    })
    joined <- paste0(output, collapse = "\n")
    with_js <- unr_add_js(joined)
    cat(with_js)
    return(with_js)
  }
}
