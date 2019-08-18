#' ical_parse_df
#'
#' Parses iCalendar format from character vector or file and returns it
#' as data.frame.
#'
#' @rdname ical_parse
#'
#' @export
#'
ical_parse_df <- function(file = NULL, text = NULL){
  as.data.frame(
    x                = ical_parse(file = file, text = text),
    stringsAsFactors = FALSE
  )
}


















