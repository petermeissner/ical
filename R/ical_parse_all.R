#' ical_parse_all
#'
#' Parses iCalendar format from character vector or file and returns ALL data found
#' in the calendar as tree like list. This function is low level and expects the
#' programmer to figure out what belongs where and how to handle things.
#'
#'
#' @rdname ical_parse
#' @export
#'
ical_parse_all <- function(file = NULL, text = NULL){

  # use ical text from character vector or from file
  if ( is.null(text) | is.function(text) ){
    text <- readLines(file, encoding = "UTF-8")
  }

  # ensure character vector only has one element
  text <- paste0(text, collapse = "\n")

  # put ical text into  V8
  v8_env$v8$assign(
    "cal_data",
    text
  )

  # parse ical text
  v8_env$v8$eval(
    "// prepare data
  vcalendar = new ICAL.Component(ICAL.parse(cal_data));

  res = {};

    {
      let data_source  = vcalendar.getAllSubcomponents().map(function(x){ return x.getAllProperties(); });
      let calendar_items = [];

      for ( let ds_i = 0; ds_i < data_source.length; ds_i++ ) {
        let element = data_source[ds_i];
        calendar_items[ds_i] = [];

        for (let prop_i = 0; prop_i < element.length; prop_i++) {
          calendar_items[ds_i][prop_i] =
            element[prop_i]
              .toJSON()
              .filter(x => typeof(x) !== 'object')
            ;
        }
      }

      let calendar_props =
        vcalendar.getAllProperties()
          .map(x => x.jCal.filter(x => typeof(x) !== 'object'))
      ;

      res =
        {
          calendar_properties: calendar_props,
          calendar_items: calendar_items
        }
      ;
    }

  ")

  # retrieve and cleanup
  tmp <- v8_env$v8$get("res")

  # return
  tmp
}

