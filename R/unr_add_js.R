#' Append knitted JS code
#'
#' This function appends knitted javascript (JS) code to the end of the original
#' chunk code(s). This is necessary to relocate and remove newly created
#' column layouts.
#'
#' @section Main idea behind JS:
#'
#' After the chunks are knitted and inserted using [unr_chunk], they create a nested div
#' structure within the main chunk. The number of newly created chunks is
#' *n* -> based on the number of breaks + 1. This JS code
#'
#' 1) generates N slides, where only the i-th element is kept,
#' 2) moves the slides after the originaly created slide.
#' 3) removes the original slide, and
#' 4) refreshes Reveal.js.
#'
#' @param code Knitted chunks of code
#' @param name Name of the caller
#'
#' @return knitted JS code, appended to the original code
unr_add_js <- function(code, name) {
  assert_string(code)
  assert_string(name)

  header <- paste0("```{js ", name, "-js}")
  body <- c(
    "var mainDiv = document.currentScript.parentElement.parentElement;",
    "if (mainDiv.querySelector(':scope > .cell-output-display')) {",
    "  mainDiv.removeChild(mainDiv.querySelector('.cell-output-display'));",
    "}",
    "if (mainDiv.querySelector(':scope > .cell-output')) {",
    "  mainDiv.removeChild(mainDiv.querySelector('.cell-output'));",
    "}",
    "var sectionParent = mainDiv.closest('section');",
    "var childDivs = Array.from(mainDiv.querySelectorAll('.columns'));",
    "var n = childDivs.length;",
    "for (let i = 0; i < n; i++) {",
    "  var sectionClone = sectionParent.cloneNode(true);",
    "  var mainDivClone = sectionClone.querySelector('div[data-unriddle=\"true\"]');",
    "  var childDivsClone = mainDivClone.querySelectorAll('.columns')",
    "  Array.from(childDivsClone).forEach((child, index) => {",
    "    if (index !== i) {",
    "      mainDivClone.removeChild(child);",
    "    }",
    "  });",
    "  if (sectionClone.id) {",
    "    sectionClone.id = sectionClone.id + (i + 1);",
    "   }",
    "   sectionParent.insertAdjacentElement('beforebegin', sectionClone);",
    "}",
    "sectionParent.remove();"
  )
  footer <- "```"

  js <- c(header, body, footer)
  js <- knitr::knit(text=js, quiet=T)
  chunk <- paste0(c(code, js), collapse = "\n")
  return(chunk)
}
