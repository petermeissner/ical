#' ical_parse
#'
#'
#'
#' @param file path to file to be read in and parsed
#' @param text text of ical file
#'
#' @export
#'
ical_parse <- function(file = NULL, text = NULL){

  if ( is.null(text) | is.function(text) ){
    text <- paste0(readLines(file), collapse = "\n")
  }

  v8_env$v8$assign(
    "cal_data",
    text
  )

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
      vcalendar
        .getAllSubcomponents()
        .map(function (x) { return x.getFirstPropertyValue('dtstart'); }),

    end:
      vcalendar
        .getAllSubcomponents()
        .map(function (x) { return x.getFirstPropertyValue('dtend'); }),

    description :
      vcalendar
        .getAllSubcomponents()
        .map(function (x) { return x.getFirstPropertyValue('description'); }),

    'last-modified' :
      vcalendar
        .getAllSubcomponents()
        .map(function (x) { return x.getFirstPropertyValue('last-modified'); }),

    'status' :
      vcalendar
        .getAllSubcomponents()
        .map(function (x) { return x.getFirstPropertyValue('status'); })
  }
  ")

  v8_env$v8$get("res")
}


















