// TODO middleware for templates

var db = require('./models')

// middleware to render the login page
exports.index = function(req, res) {
  db.measures.last(100, function(err, speeds){
    if(err) res.render('error', {msg: err})
    return res.render('index', {data: speeds})
  });
};
