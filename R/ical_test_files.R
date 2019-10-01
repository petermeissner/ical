#' ical_test_files
#'
#' Function to get file paths to local test files included in the package.
#'
#' @param fname either NULL which will list files, an integer which will select file paths by index or
#'   a string which will select files via regular expression
#'
#' @return returns one or more file paths
#'
#' @export
#'
#'
#'
#' @examples
#'
#' ical_test_files()
#' ical_test_files(1)
#' ical_test_files("mini")
#'
#'
ical_test_files <-
  function( fname = NULL ){
    files <-
      list.files(
        path       = system.file(package = "ical"),
        pattern    = "\\.ics$",
        full.names = TRUE
      )

    if ( is.null(fname) ){

      return(files)

    } else if ( is.character(fname) ){

      return(files[grep(pattern = fname, x = basename(files))])

    } else if ( is.numeric(fname) ) {

      return(files[fname])

    } else {

      stop("Do not know how to handle this input.")

    }
  }