#' ical_parse
#'
#' Parses iCalendar format from character vector or file and returns it
#' as a list of columns.
#'
#' @param file path to file to be read in and parsed
#' @param text text of ical file
#' @param return_empty_rows whether or not to filter out calendar items for
#'   which all fields are empty (NA)
#'
#' @export
#' @examples
#'
#' # parse from character vector
#' char_vec <- readLines(system.file("birthdays.ics", package = "ical"))
#' ical_parse(text = char_vec)
#'
#' # parse from file
#' ical_parse(file = system.file("birthdays.ics", package = "ical"))
#'
ical_parse <- function(file = NULL, text = NULL, return_empty_rows = FALSE){

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
            .map(function (x) {
              if ( x === null ) {
                return null;
              } else {
                return new Date(x).getTime()/1000;
              }
            })
      },

    end:
      {
        timestamp:
          vcalendar
            .getAllSubcomponents()
            .map(function (x) { return x.getFirstPropertyValue('dtend'); })
            .map(function (x) {
              if ( x === null ) {
                return null;
              } else {
                return new Date(x).getTime()/1000;
              }
            })
      },

    description :
      vcalendar
        .getAllSubcomponents()
        .map(function (x) { return x.getFirstPropertyValue('description'); }),

    location :
      vcalendar
        .getAllSubcomponents()
        .map(function (x) { return x.getFirstPropertyValue('location'); }),

    class :
      vcalendar
        .getAllSubcomponents()
        .map(function (x) { return x.getFirstPropertyValue('class'); }),

    priority :
      vcalendar
        .getAllSubcomponents()
        .map(function (x) { return x.getFirstPropertyValue('priority'); }),

    transp :
      vcalendar
        .getAllSubcomponents()
        .map(function (x) { return x.getFirstPropertyValue('transp'); }),

    dtstamp :
      {
        timestamp:
          vcalendar
            .getAllSubcomponents()
            .map(function (x) { return x.getFirstPropertyValue('dtstamp'); })
            .map(function (x) {
              if ( x === null ) {
                return null;
              } else {
                return new Date(x).getTime()/1000;
              }
            })
      },


    'last_modified' :
      {
        timestamp:
          vcalendar
            .getAllSubcomponents()
            .map(function (x) { return x.getFirstPropertyValue('last-modified'); })
            .map(function (x) {
              if ( x === null ) {
                return null;
              } else {
                return new Date(x).getTime()/1000;
              }
            })
      },

    'status' :
      vcalendar
        .getAllSubcomponents()
        .map(function (x) { return x.getFirstPropertyValue('status'); })
  }
  ")

  # retrieve and cleanup
  tmp <- ical_clean_ical_parsed(v8_env$v8$get("res"))

  # filter out missing only rows
  if ( return_empty_rows == FALSE ) {
    iffer <-
      apply(
        X =
          vapply(
            X         = tmp,
            FUN       = is.na,
            FUN.VALUE = logical(length(tmp[[1]]))
          ),
        MARGIN = 1,
        FUN    = all
      )
    tmp <-
      lapply(
        X = tmp,
        FUN = function(x){ x[ !iffer ] }
      )
  }

  # return
  tmp
}

