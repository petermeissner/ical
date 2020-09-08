var ical_source = require("./ical.js");
var fs = require("fs");

fs.readFile(process.cwd() + "\\d-mini.ics", function (err, data) {
  if (err) {
    throw (err);
  } else {
    
    // transform to string for parsing
    ical_data = data.toString();
    
    // parse ical file 
    let vcalendar = new ICAL.Component( ICAL.parse(ical_data) );
    
    // extract vevents
    let vevents = vcalendar.jCal[2].filter(
      function(item){ 
        return (item[0]==='vevent') ;
      }
    );

    // extract vevents
    let nonvevents = vcalendar.jCal[2].filter(
      function(item){ 
        return (item[0]!=='vevent') ;
      }
    );

    // collect resutlts
    let res = {
      name:        vcalendar.toJSON()[0],
      properties : vcalendar.toJSON()[1],
      items: 
        {
          vevents :   vevents,
          nonvevents: nonvevents
        }
    };

    return res;

    }
});

