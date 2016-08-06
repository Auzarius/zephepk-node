var express		= require('express'),
	app			= express(),
	bodyParser	= require('body-parser'),
	morgan		= require('morgan'),
	mysql		= require('mysql'),
	path		= require('path'),
	serverPort	= process.env.PORT || 8080;
	
var config		= require('./config'),
	mySql 		= require('./comet-node/models/mySql-pooled')(config.db);
	
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());
app.use(function (req,res,next) {
	res.setHeader('Access-Control-Allow-Origin', '*');
	res.setHeader('Access-Control-Allow-Methods', 'GET, POST');
	res.setHeader('Access-Control-Allow-Headers', 'X-Requested-With,content-type, \
	              Authorization');
	next();
});

mySql.init();

//var apiRoutes  = require('./server/routes/api')(app, express, mySql);
//app.use('/api', apiRoutes);

app.get('*', function (req, res) {
	res.sendFile(path.join(__dirname + '/public/views/index.html'));
});

app.on('error', function (err) {
	console.log(config.c.red + 'An error occured:' + config.c.reset + err );
});


app.listen(serverPort);
console.log( config.c.green + 'The Zeph EPK server is listening on port: ' + serverPort + "\x1b[31m!\x1b[0m");
