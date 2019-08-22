#' ical_parse_all
#'
#' Parses iCalendar format from character vector or file and returns ALL data found
#' in the calendar as tree like list called jcal format.
#' This function is low level and expects the
#' programmer to figure out what belongs where and how to handle things.
#'
#'
#' @rdname ical_parse
#' @export
#'
ical_parse_jcal <- function(file = NULL, text = NULL){


  # put ical text into  V8
  v8_env$v8$assign(
    "cal_data",
    ical_read_text(file = file, text = text)
  )

  # parse ical text
  v8_env$v8$eval(
    "// prepare data
  vcalendar = new ICAL.Component(ICAL.parse(cal_data));
  ")

  # retrieve and cleanup
  tmp <- v8_env$v8$get("vcalendar.jCal")

  # return
  tmp
}

