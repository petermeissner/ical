#' ical_parse_full
#'
#' Parses all calendar data - to various formats: list, list of data.frames, object.
#'
#' @rdname ical_parse
#' @export
#'
ical_parse_full <-
  function(file = NULL, text = NULL){

    # put ical text into  V8
    v8_env$v8$assign(
      "cal_data",
      ical_read_text(file = file, text = text)
    )

    # parse ical text
    v8_env$v8$eval(
      "// prepare data
      var vcalendar = new ICAL.Component(ICAL.parse(cal_data));

      // extract vevents
      var vevents = vcalendar.jCal[2].filter(
        function(item){
          return (item[0]==='vevent') ;
        }
      );

      // extract vevents
      var nonvevents = vcalendar.jCal[2].filter(
        function(item){
          return (item[0]!=='vevent') ;
        }
      );

      // collect resutlts
      var res = {
        name:        vcalendar.toJSON()[0],
        properties : vcalendar.toJSON()[1],
        items:
          {
            vevents :   vevents,
            nonvevents: nonvevents
          }
      };
  ")

    # retrieve and cleanup
    tmp <- v8_env$v8$get("res")

    # return
    tmp
  }