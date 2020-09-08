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


    let prop_tmp = vcalendar.toJSON()[1];
    let prop = {}; 
    for (let i = 0; i < prop_tmp.length; i++) {
      
      prop[prop_tmp[i][0]] = prop_tmp[i][3];
      
    }

    let nonevents_tmp = vcalendar.jCal[2].filter(
      function(item){ 
        return (item[0]!=='vevent') ;
      }
    );
    
    let nonvevents = {};
    for (let i = 0; i < nonevents_tmp.length; i++) {
      nonvevents[nonevents_tmp[i][0]] = [];
    }

    for (let i = 0; i < Object.keys(nonvevents).length; i++) {
      for (let ii = 0; ii < nonevents_tmp.length; ii++) {
        if ( nonevents_tmp[ii][0] == 'vtimezone'){
          nonvevents[Object.keys(nonvevents)[i]][ii] = nonevents_tmp[ii][1][0][3];
        }
      }
      
    }




    // collect resutlts
    let res = {
      name:        vcalendar.toJSON()[0],
      properties : prop,
      items: 
        {
          vevents :   vevents,
          nonvevents: nonvevents
        }
    };
    
    return res;

    }
});

