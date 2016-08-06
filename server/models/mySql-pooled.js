var node_mysql 		= require('mysql'),
	Connection;

module.exports = function(config) {
	
	var mySql = this;
	//if (!(this instanceof mySql)) return new mySql(config);
	mySql.config = config;
	
	mySql.init = function() {
		var vm = this,
			server = {
				host     		: vm.config.host || 'localhost',
				user     		: vm.config.user || 'root',
				password 		: vm.config.password || '',
				database 		: vm.config.database,
				port 			: vm.config.port || 3306
			};
			
		console.log('[mySql] The function has been initialized.');
		Connection = node_mysql.createPool( server );
			
		Connection.on('error', vm.handleError);
		
		Connection.on('enqueue', function () {
			console.log('[mySql] Waiting for an available connection slot.');
		});
		
		Connection.on('connection', function (connection) {
			console.log('[mySql] A connection was made to the pool on thread #' + connection.threadId);
		});
		
		process.on('uncaughtError', function (err) {
			console.log('\x1b[31mUncaught Error occured:\x1b[00m ' + err.message );
			
			if ( err.message === 'listen EADDRINUSE' ) {
				console.log("\x1b[33mIt is highly likely that the port you have chosen:\x1b[00m " +
				        + process.env.PORT + "\x1b[33m is already in use. \r\n" + 
				        "\x1b[00mPlease select a different port!");
			}
			else if ( err.message === 'connect ECONNREFUSED' ) {
				console.error('[PROC] The remote connection was refused.');
			} else {
				console.error('[PROC] \x1b[31mDetails:\x1b[00m ' + err.stack);
			}
		});
	}
	
	mySql.handleError = function (err) {
		var vm = this;
	
		if (err) {
			vm.connected = false;
			
			if ( err.code === 'PROTOCOL_CONNECTION_LOST' ) {
				Connection.removeListener('error', vm.handleError);
				Connection = null;
				console.error('[mySql] The connection was lost, recreating the connection.');
				return vm.init();
			}
		
			else if ( /ER_BAD_DB_ERROR/.test(err.code) ) {		
				console.error('[mySql] The database in your config does not exist');
				console.log('[mySql] Please re-enter the information and re-run your application.')
				process.exit(1);
			}
			
			else if ( /ECONNREFUSED/.test(err.code) ) {
				console.error('[mySql] Your MYSQL connection was refused, please make sure the server is active.');
			}
			
			else {
				console.error('[mySql]' + err.message);
			}
		}
	}
	
	mySql.verifyResult = function(result) {
		return ( result !== null && result !== undefined);
		// && /[A-Za-z0-9]+/.test(result) 
	}
	
	mySql.query = function(query, vars, next) {	
		if ( query ) {
			Connection.getConnection(function (err, connection) {
				if (!connection || err) {
					mySql.handleError(err);
				} else {
					if ( vars === null ) {
						connection.query(query, function (err, result) {
							connection.release();
							next(err, result);
						});
					} else {
						connection.query(query, vars, function (err, result) {
							connection.release();
							next(err, result);
						});
					}
				}
			});
		} else {
			throw new Error('A query must be passed as the first parameter for this function\n' +
			                '@params query (string), vars [optional] (array), callback (function)');
		}
	}

	return mySql;
}
