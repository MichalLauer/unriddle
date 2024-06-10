
<!-- README.md is generated from README.Rmd. Please edit that file -->

# unriddle

<!-- badges: start -->

[![CRAN
status](https://www.r-pkg.org/badges/version/unriddle)](https://CRAN.R-project.org/package=unriddle)
[![R-CMD-check](https://github.com/MichalLauer/unriddle/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/MichalLauer/unriddle/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

The goal of `unriddle` is to take a code that is a `riddle`, look at it
step-by-step and `unriddle` it. To do that, reveal.js and quarto needs
to be used.

## Installation

You can install the development version of unriddle from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("MichalLauer/unriddle")
```

## How to use

To enable this package, it only needs to be loaded at the beginning of
your quarto reveal.js presentation.

```` yml
---
title: My super-duper presentation
author: Michal Lauer
format: revealjs
---
```{r include=F, message=F, warning=F}
library(unriddle)
```
````

After that, `unriddling` can be easily enabled using chunk parameters.
For example, consider the following code:

```` r
```{r mtcars-plot, unriddle=TRUE}
mtcars |> #break 
  ggplot(aes(x = factor(cyl), y = disp)) +
  geom_col() + #break
  theme_bw()
```
````

This will create three different slides. On the first one, only `mtcars`
will be showed. The second slide adds the `geom_col` layer, and finally,
the third one shows the chart with additional `theme_bw`.

## Assumptions

To `unriddle` a code chunk, two assumptions must be met.

1)  The chunk has a unique name.
2)  The `unriddle` parameter is set to `true`, e.g. `unriddle=TRUE`.

You can then add custom `#break` comments to split your chunk into
multiple slides. A brief showcase can be seen here.

## Goals

- [ ] Add `#rotate` possibility
- [ ] create `unriddle::unriddle(...)` for recommended settings, such as
  - full width
  - custom css

# Acknowledgements

First, I want to thank to my precious girlfriend
[Terezka](https://github.com/tertomas) who puts up with my night
sessions and nerdy fun-facts about R.

This package is primarily inspired by the
[flipbookr](https://github.com/EvaMaeRey/flipbookr) package that does
basically the same thing. When building this package, I tried to
leverage more the strengths of the knitr package as well as some
javascript. Hopefully, this will make contributing easier as the
complexity of this package is (in my opinion) much smaller. However,
props to Eva for making the original stuff!
