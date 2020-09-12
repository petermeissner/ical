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
  df <-
    as.data.frame(
      x                = ical_parse(file = file, text = text),
      stringsAsFactors = FALSE
    )

  # filter out only NA rows and return
  ncol_df <- ncol(df)
  df[ apply(df, 1, function(x){ !(sum(is.na(x)) == ncol_df) }), ]
}


















