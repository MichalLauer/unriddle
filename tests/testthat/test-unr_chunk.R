test_that("wrong parameters are caught", {
  expect_error(unr_chunk(code = 1, name = "name"),
               regexp = "'code'")
  expect_error(unr_chunk(code = NULL, name = "name"),
               regexp = "'code'")

  expect_error(unr_chunk(code = "code", name = 1),
               regexp = "'name'")
  expect_error(unr_chunk(code = "code", name = NULL),
               regexp = "'name'")
})

test_that("unriddling chunk works.", {
  code <- c(
    "maindf |> #break",
    "  gg() + #break",
    "  bar() +",
    "  bw() #break"
  )
  formatted <- list(
    "\n```{r my-name-1}\n#| output-location: column\n#| echo: true\nmaindf\n```\n",
    "\n```{r my-name-2}\n#| output-location: column\n#| echo: true\nmaindf |>\n  gg()\n```\n",
    "\n```{r my-name-3}\n#| output-location: column\n#| echo: true\nmaindf |>\n  gg() +\n  bar() +\n  bw()\n```\n"
  )
  expect_equal(object = formatted,
               expected = unr_chunk(code, "my-name"))
})
