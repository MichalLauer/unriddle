test_that("regex checks params", {
  expect_error(escape_regex(1),    regexp = "'pattern'")
  expect_error(escape_regex(NULL), regexp = "'pattern'")
})

test_that("regex is escaped", {
  expect_equal(object = "\\)", expected = escape_regex(")"))
  expect_equal(object = "\\[", expected = escape_regex("["))
  expect_equal(object = c("\\[", "\\."), expected = escape_regex(c("[", ".")))
})
