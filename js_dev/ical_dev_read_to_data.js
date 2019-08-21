var ical_source = require("./ical.js");
var fs = require("fs");

fs.readFile(process.cwd() + "\\d-mini.ics", function (err, data) {
  if (err) {
    throw (err);
  } else {
    console.log(data.toString());
    ical_data = data.toString();
    var vcalendar = new ICAL.Component( ICAL.parse(ical_data) );
    
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

  }
});

