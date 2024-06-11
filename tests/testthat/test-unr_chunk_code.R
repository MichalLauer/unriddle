test_that("wrong parameters are caught", {
  expect_error(unr_chunk_code(code = 1),
               regexp = "'code'")
  expect_error(unr_chunk_code(code = NULL),
               regexp = "'code'")

  expect_error(unr_chunk_code(code = "code", separator = 1),
               regexp = "'separator'")
  expect_error(unr_chunk_code(code = "code", separator = NULL),
               regexp = "'separator'")

  expect_error(unr_chunk_code(code = "code", pipes = 1),
               regexp = "'pipes'")
  expect_error(unr_chunk_code(code = "code", pipes = NULL),
               regexp = "'pipes'")
})

test_that("break is removed from single-line coees", {
  code <- "mtcars"
  clean <- "mtcars"
  expect_equal(object = clean,
               expected = unr_chunk_code(code))

  code <- "mtcars #break"
  clean <- "mtcars"
  expect_equal(object = clean,
               expected = unr_chunk_code(code))

  code <- "mtcars |> #break"
  clean <- "mtcars"
  expect_equal(object = clean,
               expected = unr_chunk_code(code))

  code <- "mtcars + "
  clean <- "mtcars"
  expect_equal(object = clean,
               expected = unr_chunk_code(code))
})

test_that("break is removed from multiple lines", {
  code <- c("mtcars |> #break",
            "  ggplot(aes(x=, y=)) +")
  clean <- c("mtcars |>",
             "  ggplot(aes(x=, y=))")
  expect_equal(object = clean,
               expected = unr_chunk_code(code))

  code <- c("mtcars |> #break",
            "  ggplot(aes(x=, y=)) +",
            "  geom_bar() + #break",
            "  theme_bw() #break")
  clean <- c("mtcars |>",
             "  ggplot(aes(x=, y=)) +",
             "  geom_bar() +",
             "  theme_bw()")
  expect_equal(object = clean,
               expected = unr_chunk_code(code))
})
