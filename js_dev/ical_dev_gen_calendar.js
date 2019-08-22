var ical_source = require("./ical.js");
var fs = require("fs");

var vcalendar = new ICAL.Component();

vcalendar.addPropertyWithValue(["a","text", 1]);
