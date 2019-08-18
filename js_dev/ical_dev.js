var ical_source = require("./ical.js");
var fs = require("fs");

fs.readFile(process.cwd() + "\\d-mini.ics", function (err, data) {
  if (err) {
    throw (err);
  } else {
    console.log(data.toString());
    ical_data = data.toString();
    var ical_comp = new ICAL.Component( ICAL.parse(ical_data) );
    
    var data_source  =ical_comp.getAllSubcomponents().map(function(x){ return x.getAllProperties(); });
    var calendar_items = [];

    for (let ds_i = 0; ds_i < data_source.length; ds_i++) {
      var element = data_source[ds_i];
      calendar_items[ds_i] = [];

      for (let prop_i = 0; prop_i < element.length; prop_i++) {
        calendar_items[ds_i][prop_i] = 
          element[prop_i]
            .toJSON()
            .filter(x => typeof(x) !== "object")
          ;
      }
    }

    var calendar_props = ical_comp.getAllProperties().map(x => x.jCal.filter(x => typeof(x) !== "object"));
    var calendar =  {
        calendar_properties: calendar_props,
        calendar_items: calendar_items
      };

      ical_comp
        .getAllSubcomponents()
        .map(function (x) { return x.getFirstPropertyValue('last-modified'); })
            .map(function (x) { return new Date(x).getTime()/1000; })
        .map(function (x) { 
          if ( x === null ) { 
            return null;
          } else {
            return new Date(x).getTime()/1000; 
          }
        })
      ;

  }
});

