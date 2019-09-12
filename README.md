
<!-- README.md is generated from README.Rmd. Please edit that file -->

# imgw

[![Build
Status](https://travis-ci.org/bczernecki/imgw.png?branch=master)](https://travis-ci.org/bczernecki/imgw)
[![CRAN
status](https://www.r-pkg.org/badges/version/imgw)](https://cran.r-project.org/package=imgw)
[![CRAN RStudio mirror
downloads](http://cranlogs.r-pkg.org/badges/imgw)](https://cran.r-project.org/package=imgw)

The goal of the  **imgw** R package is to automatize downloading of meteorological
and hydrological data from the publicly available repository of Polish Institute of Meterology and Water Management - National Research Institute [(IMGW-PIB)](https://dane.imgw.pl/)

## Installation

The stable release of imgw package from the [CRAN](https://CRAN.R-project.org) reposity can be installed with:

``` r
install.packages("imgw")
```

It is highly recommended to install the most up-to-date development version of **imgw** from
[GitHub](https://github.com/bczernecki/imgw) with:

``` r
library(remotes)
install_github("bczernecki/imgw")
```

## Overview

### Meteorological data

  - **meteo()** - Downloading hourly, daily, and monthly meteorological
    data from the SYNOP/CLIMATE/PRECIP stations available in the
    danepubliczne.imgw.pl collection. It is a wrapper for
    `meteo_monthly()`, `meteo_daily()`, and `meteo_hourly()`.
    
  - **meteo\_sounding()** - Downloading measurements of
    the vertical profile of atmosphere (aka rawinsonde data)

  - **meteo\_shortening()** - Shortening column names of meteorological
    parameters to improve the readability of downloaded dataset and
    removing duplicated column names

### Hydrological data

  - **hydro()** - Downloading hourly, daily, and monthly hydrological
    data from the SYNOP / CLIMATE / PRECIP stations available in the
    danepubliczne.imgw.pl collection. It is a wrapper for
    `hydro_annual()`, `hydro_monthly()`, and `hydro_daily()`.

  - **hydro\_shortening()** - Shortening column names of hydrological
    parameters to improve the readability of downloaded dataset and
    removing duplicated column names

## Examples

``` r
library(imgw)
m = meteo_monthly(rank = "synop", year = 2000, coords = TRUE)
head(m)
#>            rank        id        X        Y   station   yy mm tmax_abs
#> 575 SYNOPTYCZNA 353230295 23.16228 53.10726 BIAŁYSTOK 2000  1      5.3
#> 577 SYNOPTYCZNA 353230295 23.16228 53.10726 BIAŁYSTOK 2000  2     10.6
#> 578 SYNOPTYCZNA 353230295 23.16228 53.10726 BIAŁYSTOK 2000  3     14.8
#> 579 SYNOPTYCZNA 353230295 23.16228 53.10726 BIAŁYSTOK 2000  4     27.8
#> 580 SYNOPTYCZNA 353230295 23.16228 53.10726 BIAŁYSTOK 2000  5     29.3
#> 581 SYNOPTYCZNA 353230295 23.16228 53.10726 BIAŁYSTOK 2000  6     32.6
#>     tmax_mean tmin_abs tmin_mean t2m_mean_mon t5cm_min rr_monthly
#> 575       0.4    -16.5      -4.5         -2.1    -23.5       34.2
#> 577       4.1    -10.4      -1.4          1.3    -12.9       25.4
#> 578       6.2     -6.4      -1.0          2.4     -9.4       45.5
#> 579      17.9     -4.6       4.7         11.5     -8.1       31.6
#> 580      21.3     -4.3       5.7         13.8     -8.3        9.4
#> 581      23.1      1.0       9.6         16.6     -1.8       36.4

h = hydro_annual(year = 2010)
head(h)
#>             id station riv_or_lake  hyy idyy Mesu idex   H beyy bemm bedd
#> 3223 150210180 ANNOPOL   Wisła (2) 2010   13    H    1 227 2009   12   19
#> 3224 150210180 ANNOPOL   Wisła (2) 2010   13    H    2 319   NA   NA   NA
#> 3225 150210180 ANNOPOL   Wisła (2) 2010   13    H    3 531 2010    3    3
#> 3226 150210180 ANNOPOL   Wisła (2) 2010   14    H    1 271 2010    8   29
#> 3227 150210180 ANNOPOL   Wisła (2) 2010   14    H    1 271 2010   10   27
#> 3228 150210180 ANNOPOL   Wisła (2) 2010   14    H    2 392   NA   NA   NA
```

## Acknowledgment

Institute of Meteorology and Water Management - National Research Institute are the sources of the data.
