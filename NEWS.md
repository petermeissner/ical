
# ical 0.3.0 -- 2019-09-08

- adding RRULE fields 


# ical 0.1.8 -- 2019-08-18

* fix: ical_parse would return valid timestamps when encountering missing 
  timestamps in data - now it returns NA, as should be expected
* minor: ical_parse_df() now returns character vectors instead of factors
* `ical_parse()` now returns many more fields: priority, class, transp, dtstamp
* by default calendar items containing only empty rows are filtered out within 
  normal parsing function


# ical 0.1.7 -- 2019-07-17

* Stéphane Trainel <stephane.trainel@gmail.com> made `ical_parse()` return 
  location field as well



# ical 0.1.6 -- 2019-01-21

* CRAN compliance: fix issue in DESCRIPTION (Author field was using R code and 
  therefore should have been Authors@R)



# ical 0.1.5 -- 2018-11-27

* CRAN compliance: quoting all software words in description



# ical 0.1.4 -- 2018-11-17

* CRAN compliance: adding examples



# ical 0.1.3 -- 2018-11-06

* CRAN compliance: title case; quoting; improve package description



# ical 0.1.2 -- 2018-11-05

* Added a further tests
* Added a `NEWS.md` file to track changes to the package.



# ical 0.1.1 -- 2018-10-24

* fix: ical_parse_df() would not return data.frame()



# ical 0.1.0 -- 2018-10-11

* setting things up
* sketching things out
