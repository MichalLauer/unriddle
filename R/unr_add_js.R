unr_add_js <- function(code, name) {
  header <- paste0("```{js ", name, "-js}")
  # body <- c(
  #   "let mainDivs = document.querySelectorAll('div[data-unriddle=\"true\"]');",
  #   "mainDivs.forEach(mainDiv => {",
  #   "  mainDiv.removeChild(mainDiv.querySelector('.cell-output-display'))",
  #   "  let sectionParent = mainDiv.closest('section');",
  #   "  let childDivs = Array.from(mainDiv.querySelectorAll('.columns'));",
  #   "  let n = childDivs.length;",
  #   "  for (let i = 0; i < n; i++) {",
  #   "    let sectionClone = sectionParent.cloneNode(true);",
  #   "    let mainDivClone = sectionClone.querySelector('div[data-unriddle=\"true\"]');",
  #   "    let childDivsClone = mainDivClone.querySelectorAll('.columns')",
  #   "    Array.from(childDivsClone).forEach((child, index) => {",
  #   "      if (index !== i) {",
  #   "        mainDivClone.removeChild(child);",
  #   "      }",
  #   "    });",
  #   "    if (sectionClone.id) {",
  #   "      sectionClone.id = sectionClone.id + (i + 1);",
  #   "    }",
  #   "    sectionParent.insertAdjacentElement('beforebegin', sectionClone);",
  #   "  }",
  #   "  sectionParent.remove();",
  #   "});"
  # )
  body <- c(
    "var mainDiv = document.currentScript.parentElement.parentElement;",
    "mainDiv.removeChild(mainDiv.querySelector('.cell-output-display'))",
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
