
<!-- README.md is generated from README.Rmd. Please edit that file -->

## iCalendar parsing

**Status**

*lines of R code:* 92, *lines of test code:* 62

[![Project Status: Initial development is in progress, but there has not
yet been a stable, usable release suitable for the
public.](http://www.repostatus.org/badges/latest/active.svg)](http://www.repostatus.org/#active)
<a href="https://travis-ci.org/petermeissner/ical">
<img src="https://api.travis-ci.org/petermeissner/ical.svg?branch=master">
<a/> <a href="https://cran.r-project.org/package=ical">
<img src="http://www.r-pkg.org/badges/version/ical"> </a>
<a href="https://codecov.io/gh/petermeissner/ical">
<img src="https://codecov.io/gh/petermeissner/ical/branch/master/graph/badge.svg" alt="Codecov" />
</a> <img src="http://cranlogs.r-pkg.org/badges/grand-total/ical">
<img src="http://cranlogs.r-pkg.org/badges/ical">

**Development version**

0.1.2 - 2018-11-05 / 10:59:57

**Description**

A simple wrapper around the ical.js library executing JS-code via V8.
The package enables users to parse iCalendar files (.ics, .ifb, .iCal,
.iFBf).

**License**

MIT + file LICENSE <br>c( person( “Peter”, “Meissner”, role = c(“aut”,
“cre”), email = “<retep.meissner@gmail.com>” ), person( “Philipp”,
“Kewisch”, role = “cph”, comment = “Ical.js file is is licences under
MPL. Source: <https://github.com/mozilla-comm/ical.js>” ) )

**Contribution - AKA The-Think-Twice-Be-Nice-Rule**

Please note that this project is released with a Contributor Code of
Conduct. By participating in this project you agree to abide by its
terms:

<http://contributor-covenant.org/version/1/0/0/>

## Installation

**Installation and start - stable version**

``` r
install.packages("ical")

library(ical)
```

**Installation and start - development version**

``` r
if (!require("V8")) {
  install.packages("V8")
}

devtools::install_github("petermeissner/ical")

library(ical)
```

## Usage

**laoding package**

``` r
library(ical)
```

**get path to a ical file**

``` r
ical_file <- system.file("birthdays.ics", package = "ical")
```

**parse file to data.frame**

``` r
ical_parse_df(ical_file)
##                                         uid              summary               start                 end
## 1 2014_BIRTHDAY_79d389868f96182e@google.com PErson #2's birthday 2014-12-10 01:00:00 2014-12-11 01:00:00
## 2      BIRTHDAY_79d389868f96182e@google.com PErson #2's birthday 2012-12-10 01:00:00 2012-12-11 01:00:00
## 3      BIRTHDAY_79d389868f96182e@google.com PErson #2's birthday 2013-12-10 01:00:00 2013-12-11 01:00:00
## 4      BIRTHDAY_79d389868f96182e@google.com PErson #2's birthday 2014-12-10 01:00:00 2014-12-11 01:00:00
##                      description       last.modified    status
## 1                           <NA> 2012-12-07 19:30:41 CONFIRMED
## 2 Today is PErson #2's birthday! 2012-12-07 19:30:41 CONFIRMED
## 3 Today is PErson #2's birthday! 2012-12-07 19:30:41 CONFIRMED
## 4 Today is PErson #2's birthday! 2012-12-07 19:30:41 CONFIRMED
```
