var express		= require('express'),
	app			= express(),
	bodyParser	= require('body-parser'),
//	morgan		= require('morgan'),
	path		= require('path'),
	serverPort	= process.env.PORT || 8080;
	
var config		= require('./config'),
	mySql 		= require('./server/models/mySql-pooled')(config.db);

app.set("view engine", "vash");

app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());
app.use(function (req,res,next) {
	res.setHeader('Access-Control-Allow-Origin', '*');
	res.setHeader('Access-Control-Allow-Methods', 'GET, POST');
	res.setHeader('Access-Control-Allow-Headers', 'X-Requested-With, content-type, Authorization');
	next();
});

app.use(express.static(__dirname + "/public"));

mySql.init();

var mainRoutes  = require('./server/routes')(app, express, mySql);
app.use('/', mainRoutes);

/*app.get('*', function (req, res) {
	res.sendFile(path.join(__dirname + '/views/index.html'));
});*/

app.on('error', function (err) {
	console.log( '\x1b[31mAn error occured:\x1b[00m' + err );
});


app.listen(serverPort);
console.log( '\x1b[32mThe Zeph EPK server is listening on port: ' + serverPort + "\x1b[31m!\x1b[0m");
