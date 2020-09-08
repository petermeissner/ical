#' ical_clean_ical_parsed
#'
#'
#' @param ical_parsed data provided by \code{ical_parse()}
#'
#' @export
#'
ical_clean_ical_parsed <- function(ical_parsed) {

  # clean up
  ical_parsed_clean <- list()
  clean_collapse <-
    function(x){
      x[is.na(x)] <- ""
      vapply(
        X = x,
        FUN = paste,
        FUN.VALUE = "",
        collapse = ", ",
        USE.NAMES = FALSE
      )
    }

  for ( i in seq_along(ical_parsed) ){
    x      <- ical_parsed[[i]]
    x_name <- names(ical_parsed)[i]

    if (is.list(x) && length(names(x)) == 1 && "timestamp" == names(x)) {

      ical_parsed_clean[[ names(ical_parsed)[i] ]] <-
        as.POSIXct(x$timestamp, origin = "1970-01-01")

    } else if ( is.list(x) && length(names(x)) > 1 ){

      for ( k in seq_along(x) ){
        ical_parsed_clean[[ paste0(x_name, "_", names(x)[k]) ]] <-
          clean_collapse(x[[k]])
      }

    } else {
      ical_parsed_clean[[ names(ical_parsed)[i] ]] <- x
    }
  }

  # return
  ical_parsed_clean
}