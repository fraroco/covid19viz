
<!-- README.md is generated from README.Rmd. Please edit that file -->

# covid19viz

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
[![CRAN
status](https://www.r-pkg.org/badges/version/covid19viz)](https://cran.r-project.org/package=covid19viz)
<!-- badges: end -->

The goal of `covid19viz` is to access and summarize WHO sitreps for
covid-19 in simple graphics.

This package works using two data repositories:

  - digitalized WHO sitreps by [Fabienne
    Krauer](https://twitter.com/FabiKrauer) available in
    [fkrauer/COVID-19](https://github.com/fkrauer/COVID-19).

  - Johns Hopkins University (JHU CSSE) available in
    [CSSEGISandData/COVID-19](https://github.com/CSSEGISandData/COVID-19).

## Installation

<!--
You can install the released version of covid19viz from [CRAN](https://CRAN.R-project.org) with:

``` r
install.packages("covid19viz")
```
-->

You can install the development version of `covid19viz` using:

``` r
if(!require("remotes")) install.packages("remotes")
remotes::install_github("avallecam/covid19viz")
```

## Quick Example

### with WHO sitreps

``` r
library(covid19viz)

# paste las update available at
# https://github.com/fkrauer/COVID-19
update <- "2020-03-10"

# apply
who_sitrep_country_report(
  update = update,
  country = "Brazil")
```

<img src="man/figures/README-unnamed-chunk-2-1.png" width="100%" />

### with JHU collection

``` r
library(tidyverse)

jhu_sitrep <- jhu_sitrep_import(source = "confirmed")

jhu_sitrep %>%
  jhu_sitrep_cleandb() %>%
  filter(country_region=="Peru") %>%
  arrange(desc(value))
#> # A tibble: 50 x 7
#>    source    country_region province_state   lat  long dates      value
#>    <chr>     <chr>          <chr>          <dbl> <dbl> <date>     <dbl>
#>  1 confirmed Peru           <NA>           -9.19 -75.0 2020-03-10    11
#>  2 confirmed Peru           <NA>           -9.19 -75.0 2020-03-11    11
#>  3 confirmed Peru           <NA>           -9.19 -75.0 2020-03-09     7
#>  4 confirmed Peru           <NA>           -9.19 -75.0 2020-03-08     6
#>  5 confirmed Peru           <NA>           -9.19 -75.0 2020-03-06     1
#>  6 confirmed Peru           <NA>           -9.19 -75.0 2020-03-07     1
#>  7 confirmed Peru           <NA>           -9.19 -75.0 2020-01-22     0
#>  8 confirmed Peru           <NA>           -9.19 -75.0 2020-01-23     0
#>  9 confirmed Peru           <NA>           -9.19 -75.0 2020-01-24     0
#> 10 confirmed Peru           <NA>           -9.19 -75.0 2020-01-25     0
#> # ... with 40 more rows
```
