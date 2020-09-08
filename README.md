
<!-- README.md is generated from README.Rmd. Please edit that file -->

## ‘iCalendar’ Parsing

**Status**

*lines of R code:* 296, *lines of test code:* 97

[![Project Status: Initial development is in progress, but there has not
yet been a stable, usable release suitable for the
public.](http://www.repostatus.org/badges/latest/active.svg)](http://www.repostatus.org/#active)
<a href="https://travis-ci.org/petermeissner/ical">
<img src="https://api.travis-ci.org/petermeissner/ical.svg?branch=master">
<a/> [![AppVeyor build
status](https://ci.appveyor.com/api/projects/status/github/petermeissner/ical?branch=master&svg=true)](https://ci.appveyor.com/project/petermeissner/ical)
<a href="https://cran.r-project.org/package=ical">
<img src="http://www.r-pkg.org/badges/version/ical"> </a>
<a href="https://codecov.io/gh/petermeissner/ical">
<img src="https://codecov.io/gh/petermeissner/ical/branch/master/graph/badge.svg" alt="Codecov" />
</a> <img src="http://cranlogs.r-pkg.org/badges/grand-total/ical">
<img src="http://cranlogs.r-pkg.org/badges/ical">

**Development version**

0.3.0 - 2020-09-08 / 09:00:18

**Description**

A simple wrapper around the ‘ical.js’ library executing ‘Javascript’
code via ‘V8’ (the ‘Javascript’ engine driving the ‘Chrome’ browser and
‘Node.js’ and accessible via the ‘V8’ R package). This package enables
users to parse ‘iCalendar’ files (‘.ics’, ‘.ifb’, ‘.iCal’, ‘.iFBf’) into
lists and ‘data.frames’ to ultimately do statistics on events, meetings,
schedules, birthdays, and the like.

**License**

MIT + file LICENSE <br>Peter Meissner \[aut, cre\], Philipp Kewisch
\[cph\] (Ical.js file is is licences under MPL. Source:
<https://github.com/mozilla-comm/ical.js>)

**Contribution - AKA The-Think-Twice-Be-Nice-Rule**

Please note that this project is released with a Contributor Code of
Conduct. By participating in this project you agree to abide by its
terms:

<http://contributor-covenant.org/version/1/0/0/>

## Other Packages

There is one other package on CRAN that does calendar file parsing, too
and which might be worth a look or two since is dedicated to cover a
much broader range of use cases than ical - e.g. reading and writing
ical files:

  - Repo: <https://github.com/ATFutures/calendar>
  - CRAN page:
    <https://cran.r-project.org/web/packages/calendar/index.html>
  - Vignette:
    <https://cran.r-project.org/web/packages/calendar/vignettes/ical-creating-calendars.html>

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
##                      description    location  class priority transp rrule_freq rrule_count
## 1                           <NA>       Paris PUBLIC       NA OPAQUE      DAILY           1
## 2 Today is PErson #2's birthday! Los Angeles PUBLIC       NA OPAQUE                       
## 3 Today is PErson #2's birthday!             PUBLIC       NA OPAQUE                       
## 4 Today is PErson #2's birthday!        <NA> PUBLIC       NA OPAQUE                       
##               dtstamp       last_modified    status
## 1 2012-12-07 19:30:41 2012-12-07 19:30:41 CONFIRMED
## 2 2012-12-07 19:30:41 2012-12-07 19:30:41 CONFIRMED
## 3 2012-12-07 19:30:41 2012-12-07 19:30:41 CONFIRMED
## 4 2012-12-07 19:30:41 2012-12-07 19:30:41 CONFIRMED
```

## Sources

  - <https://en.wikipedia.org/wiki/ICalendar>
  - <https://www.kanzaki.com/docs/ical/>
