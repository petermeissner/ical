#' ical_parse
#'
#' Parses iCalendar format from character vector or file and returns it
#' as a list of colums.
#'
#' @param file path to file to be read in and parsed
#' @param text text of ical file
#'
#' @export
#'
ical_parse <- function(file = NULL, text = NULL){

  # use ical text from character vector or from file
  if ( is.null(text) | is.function(text) ){
    text <- readLines(file)
  }

  # ensure character vector only has one element
  text <- paste0(text, collapse = "\n")

  # put ical text into  V8
  v8_env$v8$assign(
    "cal_data",
    text
  )

  # parse ical text
  v8_env$v8$eval(
    "
  // prepare data
  vcalendar = new ICAL.Component(ICAL.parse(cal_data));

  res =
  {
    uid :
      vcalendar
        .getAllSubcomponents()
        .map(function (x) { return x.getFirstPropertyValue('uid'); }),

    summary :
      vcalendar
        .getAllSubcomponents()
        .map(function (x) { return x.getFirstPropertyValue('summary'); }),

    start :
      {
        timestamp:
          vcalendar
            .getAllSubcomponents()
            .map(function (x) { return x.getFirstPropertyValue('dtstart'); })
            .map(function (x) { return new Date(x).getTime()/1000; })
      },

    end:
      {
        timestamp:
          vcalendar
            .getAllSubcomponents()
            .map(function (x) { return x.getFirstPropertyValue('dtend'); })
            .map(function (x) { return new Date(x).getTime()/1000; })
      },

    description :
      vcalendar
        .getAllSubcomponents()
        .map(function (x) { return x.getFirstPropertyValue('description'); }),

    'last-modified' :
      {
        timestamp:
          vcalendar
            .getAllSubcomponents()
            .map(function (x) { return x.getFirstPropertyValue('last-modified'); })
            .map(function (x) { return new Date(x).getTime()/1000; })
      },

    'status' :
      vcalendar
        .getAllSubcomponents()
        .map(function (x) { return x.getFirstPropertyValue('status'); })
  }
  ")

  # retrieve and return
  v8_env$v8$get("res")
}

