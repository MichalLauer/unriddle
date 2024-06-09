unr_add_js <- function(code) {
  header <- "```{js aaa}"
  body <- c(
    "const mainDivs = document.querySelectorAll('div[data-unriddle=\"true\"]');",
    "mainDivs.forEach(mainDiv => {",
    "  mainDiv.removeChild(mainDiv.querySelector('.cell-output-display'))",
    "  const sectionParent = mainDiv.closest('section');",
    "  const childDivs = Array.from(mainDiv.querySelectorAll('.columns'));",
    "  const n = childDivs.length;",
    "  for (let i = 0; i < n; i++) {",
    "    const sectionClone = sectionParent.cloneNode(true);",
    "    const mainDivClone = sectionClone.querySelector('div[data-unriddle=\"true\"]');",
    "    const childDivsClone = mainDivClone.querySelectorAll('.columns')",
    "    Array.from(childDivsClone).forEach((child, index) => {",
    "      if (index !== i) {",
    "        mainDivClone.removeChild(child);",
    "      }",
    "    });",
    "    if (sectionClone.id) {",
    "      sectionClone.id = sectionClone.id + (i + 1);",
    "    }",
    "    sectionParent.insertAdjacentElement('beforebegin', sectionClone);",
    "  }",
    "  sectionParent.remove();",
    "});"
  )
  footer <- "```"

  js <- c(header, body, footer)
  js <- knitr::knit(text=js, quiet=T)
  chunk <- paste0(c(code, js), collapse = "\n")
  return(chunk)
}
