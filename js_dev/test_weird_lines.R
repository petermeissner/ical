u = "https://github.com/ATFutures/calendar/releases/download/0.0.1/d-mini.ics"
download.file(url = u, destfile = "d-mini.ics")
library(tibble)
library(magrittr)

c1 = calendar::ic_read("inst/d-mini.ics")
ncol(c1)
nrow(c1)
head(c1)


c2 = ical::ical_parse_df("inst/d-mini.ics") %>% as_tibble()
ncol(c2)
nrow(c2)
c2
