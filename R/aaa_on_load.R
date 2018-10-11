#' env$v8 ...
#' 
#' An environment containing bindings to an V8 instance for evaluating JS code.
#' 
#' @keywords internal
#' 
v8_env <- new.env(parent=emptyenv())

.onLoad <- function(libname, pkgname) {
  v8_env$v8 <- V8::v8()
  v8_env$v8$source(system.file("ical.js", package = "iCalendar"))
}
