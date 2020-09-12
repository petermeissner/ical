#' ical_read_text
#'
#' Reads in text files or prepares character vectors.
#' Either `file` or `text` have to be specified.
#'
#' @param file a file path or connection object.
#' @param text a character vector.
#' @param enc encoding of the file to be read in
#'
ical_read_text <-
  function(file = NULL, text = NULL, enc = "UTF-8"){

    # check inputs
    stopifnot( !is.null(file) | !is.null(text) )

    # use ical text from character vector or from file
    if ( is.null(text) | is.function(text) ){
      text <- readLines(file, encoding = enc)

    }

    # ensure character vector
    #   - is UTF-8 encoded
    #   - is a single element character vector
    paste0(
      enc2utf8(text),
      collapse = "\n"
    )

  }