#' ical_parse_list
#'
#' Parses iCalendar format from character vector or file and returns it
#' as a list of entries.
#'
#' @rdname ical_parse
#'
#' @export
#'
ical_parse_list <- function(file = NULL, text = NULL){

  # parse ical data
  ical_parsed <- ical_parse(file = file, text = text)

  # go through all items and all columns to assamble entries
  res <- list()
  ical_parsed_names <- names(ical_parsed)

    for( i in seq_len(length(ical_parsed[[1]])) ){
      res_i <- list()
      for ( k in seq_along(ical_parsed) ){
        res_i[[ical_parsed_names[k]]] <- ical_parsed[[ical_parsed_names[k]]][i]
      }
      res[[length(res) + 1]] <- res_i
    }

  # return
  res
}


















