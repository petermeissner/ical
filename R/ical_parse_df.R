#' ical_parse_df
#'
#' Parses iCalendar format from character vector or file and returns it
#' as data.frame.
#'
#' @rdname ical_parse
#'
#' @param file path to file to be read in and parsed
#' @param text text of ical file
#'
#' @export
#'
ical_parse_df <- function(file = NULL, text = NULL){
  ical_parse(file = file, text = text)
}


















