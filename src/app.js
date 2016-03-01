var express = require('express')
var site    = require('./site')

var app = express.createServer();
// configure express
app.set('view engine', 'ejs');  // define the template engine (alternative: jade)
app.use(express.logger());
app.use(express.cookieParser());
app.use(express.bodyParser());
app.use(app.router);
app.use(express.errorHandler({ dumpExceptions: true, showStack: true }));

app.get('/', site.index);
app.use(express.static(__dirname + '/assets'));
app.use(express.static('/data'));

app.listen(80);
