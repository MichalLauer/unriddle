rea
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

    ---
    title: My super-duper presentation
    author: Michal Lauer
    format: revealjs
    \`\`\`{r }
    library(unriddle)
    \`\`\`

To unriddle a code chunk, two assumptions must be met.

1)  The chunk has a unique name.
2)  The `unriddle` parameter is set to `true`, e.g. `unriddle=TRUE`.

You can then add custom `#break` comments to split your chunk into
multiple slides. A brief showcase can be seen
<span style="color: red">here</red>.

``` r
summary(cars)
#>      speed           dist       
#>  Min.   : 4.0   Min.   :  2.00  
#>  1st Qu.:12.0   1st Qu.: 26.00  
#>  Median :15.0   Median : 36.00  
#>  Mean   :15.4   Mean   : 42.98  
#>  3rd Qu.:19.0   3rd Qu.: 56.00  
#>  Max.   :25.0   Max.   :120.00
```

You’ll still need to render `README.Rmd` regularly, to keep `README.md`
up-to-date. `devtools::build_readme()` is handy for this.

You can also embed plots, for example:

<img src="man/figures/README-pressure-1.png" width="100%" />

In that case, don’t forget to commit and push the resulting figure
files, so they display on GitHub and CRAN.
