
# gwpdata

<!-- badges: start -->
<!-- badges: end -->

Use this package for an easy and consistent use of Global Warming Potentials.

The provided data was taken from https://github.com/openclimatedata/globalwarmingpotentials (17.02.2023).
Please find additional information about data sources there or in the header of the [CSV file](https://github.com/pweigmann/gwpdata/blob/main/inst/extdata/globalwarmingpotentials.csv).


## Installation

You can install the development version of gwpdata from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("pweigmann/gwpdata")
```

## Usage

Specify a `source` (default = "AR6"), `metric` (default = "GWP100") and optionally a `species`. 

Available combinations are:
- SAR GWP100
- AR4 GWP100
- AR5 GWP100
- AR5 CCFGWP100
- AR6 GWP100
- AR6 GWP20
- AR6 GWP500
- AR6 GTP100

Example
``` r
library(gwpdata)
df  <- getGWP(source = "AR6", metric = "GWP100")  # returns a dataframe
val <- getGWP(source = "AR6", metric = "GWP100", species = "CH4")  # returns a single value
```

