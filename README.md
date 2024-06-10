
<!-- README.md is generated from README.Rmd. Please edit that file -->

# unriddle

<!-- badges: start -->

[![CRAN
status](https://www.r-pkg.org/badges/version/unriddle)](https://CRAN.R-project.org/package=unriddle)
[![R-CMD-check](https://github.com/MichalLauer/unriddle/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/MichalLauer/unriddle/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

The goal of unriddle is to …

## Installation

You can install the development version of unriddle from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("MichalLauer/unriddle")
```

## How to use

To enable this package, it only needs to be loaded at the beggining of
you quarto document.

```` yml
---
title: My super-duper presentation
author: Michal Lauer
format: revealjs
---
```\{r \}
library(unriddle)
```
````

To unriddle a code chunk, two assumptions must be met.

1)  The chunk has a unique name.
2)  The `unriddle` parameter is set to `true`, e.g. `unriddle=TRUE`.

You can then add custom `#break` comments to split your chunk into
multiple slides. A brief showcase can be seen
<span style="color: red">here</red>.
