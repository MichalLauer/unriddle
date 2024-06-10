.onLoad <- function(libname, pkgname) {
  knitr::knit_hooks$set(unriddle = unriddle)
}
