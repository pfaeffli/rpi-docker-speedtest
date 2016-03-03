exports.last = function(interval, done) {
  // load file here
  var fs = require('fs');
  fs.readFile( '/data/speeds.csv', function (err, data) {
    if (err) return done(err, null);
    // get the input stream of the file
    var lines = data.toString().split("\n");
    var res = [[],[],[],[]];
    var start = 0;
    if (lines.length > 250) start = lines.length - 251;
    for (i = start; i < lines.length; i++) {
      var line = lines[i];
      if(line.length > 0) {
        var items = line.split(';');
        if(items.length >= 4) {
          var times = items[0].toString().replace('  ', ' ').split(' ');
          var clock = times[3].split(':');
          res[0].push(times[2] + '-' + times[1] + '-' + times[4] + ' ' + (parseInt(clock[0]) + 1).toString() + ':' + clock[1] + ' [' + times[0] + ']');
          res[1].push(items[1]);
          res[2].push(items[2]);
          res[3].push(items[3]);
        }
      }
    }
    return done(null, res);
  });
};
