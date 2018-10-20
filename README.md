
<!-- README.md is generated from README.Rmd. Please edit that file -->

## iCalendar parsing

**Status**

*lines of R code:* 90, *lines of test code:* 22

[![Project Status: Initial development is in progress, but there has not
yet been a stable, usable release suitable for the
public.](http://www.repostatus.org/badges/latest/wip.svg)](http://www.repostatus.org/#wip)
<a href="https://travis-ci.org/petermeissner/ical">
<img src="https://api.travis-ci.org/petermeissner/ical.svg?branch=master">
<a/> <a href="https://cran.r-project.org/package=ical">
<img src="http://www.r-pkg.org/badges/version/ical"> </a>
<a href="https://codecov.io/gh/petermeissner/ical">
<img src="https://codecov.io/gh/petermeissner/ical/branch/master/graph/badge.svg" alt="Codecov" />
</a> <img src="http://cranlogs.r-pkg.org/badges/grand-total/ical">
<img src="http://cranlogs.r-pkg.org/badges/ical">

**Development version**

0.1.0 - 2018-10-20 / 05:27:52

**Description**

A simple wrapper around the ical.js library executing JS-code via V8.
The package enables users to parse iCalendar files.

**License**

MIT + file LICENSE <br>c( person( “Peter”, “Meissner”, role = c(“aut”,
“cre”), email = “<retep.meissner@gmail.com>” ), person( “Philipp”,
“Kewisch”, role = “cph”, comment = “Ical.js file is is licences under
MPL. Source: <https://github.com/mozilla-comm/ical.js>” ) )

**Citation**

``` r
citation("ical")
```

**BibTex for citing**

``` r
toBibtex(citation("ical"))
```

**Contribution - AKA The-Think-Twice-Be-Nice-Rule**

Please note that this project is released with a Contributor Code of
Conduct. By participating in this project you agree to abide by its
terms:

> As contributors and maintainers of this project, we pledge to respect
> all people who contribute through reporting issues, posting feature
> requests, updating documentation, submitting pull requests or patches,
> and other activities.
> 
> We are committed to making participation in this project a
> harassment-free experience for everyone, regardless of level of
> experience, gender, gender identity and expression, sexual
> orientation, disability, personal appearance, body size, race,
> ethnicity, age, or religion.
> 
> Examples of unacceptable behavior by participants include the use of
> sexual language or imagery, derogatory comments or personal attacks,
> trolling, public or private harassment, insults, or other
> unprofessional conduct.
> 
> Project maintainers have the right and responsibility to remove, edit,
> or reject comments, commits, code, wiki edits, issues, and other
> contributions that are not aligned to this Code of Conduct. Project
> maintainers who do not follow the Code of Conduct may be removed from
> the project team.
> 
> Instances of abusive, harassing, or otherwise unacceptable behavior
> may be reported by opening an issue or contacting one or more of the
> project maintainers.
> 
> This Code of Conduct is adapted from the Contributor Covenant
> (<http://contributor-covenant.org>), version 1.0.0, available at
> <http://contributor-covenant.org/version/1/0/0/>

## Installation

**Installation and start - stable version**

``` r
install.packages("ical")
library(ical)
```

**Installation and start - development version**

``` r
devtools::install_github("petermeissner/ical")
library(ical)
```
