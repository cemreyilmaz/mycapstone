
<!-- README.md is generated from README.Rmd. Please edit that file -->

# mycapstone

<!-- badges: start -->
<!-- badges: end -->

The goal of mycapstone is to analyze the earthquake data that were
collected and archived by NOAA and that can be found at
<https://www.ngdc.noaa.gov/hazard/strong.shtml>.

## Installation

You can install the released version of mycapstone from
[CRAN](https://CRAN.R-project.org) with:

``` r
install.packages("mycapstone")
```

## Example

This is a basic example which shows you how to clean your data:

``` r
library(mycapstone)
## basic example code
data <- utils::read.delim("earthquakes.tsv")
data <- eq_clean_data(data)
data <- eq_location_clean(data)
```
