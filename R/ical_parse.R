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
ical_parse <- function(file = NULL, text = NULL, simplify = TRUE){

  text <- ical_read_text(file = file, text = text)
  tmp  <- list()

  for ( i in seq_along(text)){
    # put ical text into  V8
    v8_env$v8$assign(
      "cal_data",
      text[i]
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

    dtstart :
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

    dtend:
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

    rrule :
        vcalendar
        .getAllSubcomponents()
        .map(function (x) { return x.getFirstPropertyValue('rrule'); }),

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


    'last-modified' :
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
    res <- v8_env$v8$get("res")
    tmp[[length(tmp) + 1]] <- ical_clean_ical_parsed(res)

  }

  # return
  if ( length(tmp) == 1 & simplify == TRUE ){
    return(tmp[[1]])
  } else {
    return(tmp)
  }
}

