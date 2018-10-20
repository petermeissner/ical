#' ical_clean_ical_parsed
#'
#'
#' @param ical_parsed data provided by \code{ical_parse()}
#'
#' @export
#'
ical_clean_ical_parsed <- function(ical_parsed) {

  # define worker function
  ical_clean_ical_parsed_worker <-
    function(x){
      if (is.list(x)) {
        return(as.POSIXct(x$timestamp, origin = "1970-01-01"))
      } else {
        return(x)
      }
    }

  # clean up and return
  lapply(ical_parsed, ical_clean_ical_parsed_worker)
}