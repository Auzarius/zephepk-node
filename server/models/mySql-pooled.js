var node_mysql 		= require('mysql'),
	bcrypt  		= require('bcrypt'),
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
				        process.env.PORT + "\x1b[33m is already in use. \r\n" + 
				        "\x1b[00mPlease select a different port!");
			}
			else if ( err.message === 'connect ECONNREFUSED' ) {
				console.error('[PROC] The remote connection was refused.');
			} else {
				console.error('[PROC] \x1b[31mDetails:\x1b[00m ' + err.stack);
			}
		});
	};
	
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
				return err.message;
			}
			
			else {
				console.error('[mySql]' + err.message);
				return err.message;
			}
		} else {
			return false;
		}
	};
	
	mySql.verifyResult = function(result) {
		return ( result !== null && result !== undefined);
		// && /[A-Za-z0-9]+/.test(result) 
	};
	
	mySql.query = function(query, vars, next) {	
		if ( query ) {
			Connection.getConnection(function (err, connection) {
				if (!connection) {
					console.error('A connection could not be opened.');
					mySql.handleError(err);
				} else if (err) {
					connection.release();
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
			connection.release();
			throw new Error('A query must be passed as the first parameter for this function\n' +
			                '@params query (string), vars [optional] (array), callback (function)');
		}
	};
	
	mySql.getAlbumData = function(album) {
		var query = 'SELECT t.TrackNum, t.Name, t.Length, t.Lyrics ' +
					'FROM AlbumTracks t ' +
					'LEFT JOIN Albums a ' +
					'ON t.Albumid = a.Id ' +
					'WHERE a.Name = \'' + Connection.escape(album) + '\'';
		mySql.query(query, function(err, result) {
			if (err) {
				throw new Error(err);
			} else if (mySql.verifyResult(result[0])) {
				return result[0];
			} else {
				return false;
			}
		});
	};
	
	mySql.getTourData = function(next) {
		var query = 'SELECT ShowDate, City, State, Venue, ' +
					'Bands, Attendance ' +
					'FROM TourDates ' +
					'ORDER BY ShowDate DESC';
					
		mySql.query(query, null, function(err, result) {
			if (err) {
				throw new Error(err);
			} else {
				next(null, result);
			}
		});
	};
	
	mySql.users = {
		all : function (next) {
			//console.log('\x1b[33musers.all query\x1b[0m');
			var query = 'SELECT id, username, firstName, lastName, email, role FROM ' + mySql.config.users_table + ' ORDER BY firstName, lastName, role ASC';
			
			mySql.query(query, null, function (err, result) {
				if (err) {
					throw new Error(err);
					next(err);
				} else if ( mySql.verifyResult(result)) {
					next(null, {
						success : true,
						data 	: result,
						message : ''
					});
				} else {
					next(null, {
						success : false,
						message : 'There are no users available at this time.'
					});
				}
			});
		},
		
		findOne : function (options, next) {
			//console.log('\x1b[33musers.findOne query\x1b[0m');
			var query = 'SELECT id, username, firstName, lastName, email, role FROM ' + mySql.config.users_table + ' WHERE ?';
			
			if ( options ) {
				mySql.query(query, options, function (err, result) {
					if (err) {
						throw new Error(err);
						next(err);
					} else if ( mySql.verifyResult(result[0])) {
						next(null, {
							success : true,
							data 	: result[0],
							status 	: 200
						});
					} else {
						next(null, {
							success : false,
							status 	: 304,
							message : 'The user you were looking for could not be found.'
						});
					}
				});
			} else {
				throw new Error('No options were passed for the search query.');
				next({
					success : false,
					message : 'No options were passed for the search query.',
					value	: options,
					note	: 'If you received this in error, please notify the admin.'
				});
			}
		},
		
		findLogin : function (options, next) {
			//console.log('\x1b[33musers.findLogin query\x1b[0m');
			var query = 'SELECT id, username, password, firstName, lastName, role, email FROM ' + mySql.config.users_table + ' WHERE ?';
			
			if ( options ) {
				mySql.query(query, options, function (err, result) {
					if (err) {
						throw new Error(err);
						next(err);
					} else if ( mySql.verifyResult(result[0])) {
						next(null, {
							success : true,
							data 	: result[0],
						});
					} else {
						next(null, {
							success : false,
							message : 'No users were found that matched your query.'
						});
					}
				});
			} else {
				console.err('No options were passed for the search query.');
				next({
					success : false,
					message : 'No options were passed for the search query.',
					value	: options,
					note	: 'If you received this in error, please notify the admin.'
				});
			}
			
		},
		
		create : function (user, next) {
			//console.log('\x1b[33musers.create query\x1b[0m');
			var query = 'INSERT INTO ' + mySql.config.users_table + ' SET ?';
			
			if ( user ) {
				mySql.query(query, user, function (err, result) {
					if (err) {
						if (err.errno === 1062) {
							next(null, {
								success : false,
								message : 'That username is already in use.  Please try a different username.'
							});
						} else {
							throw new Error(err);
							next(err);
						}
					} else if ( result.affectedRows > 0 ) {
						next(null, {
							success : true,
							message : 'The user was created successfully!'
						});
					} else {
						next(null, {
							success : false,
							message	: 'An error occured while creating the user.'
						});
					}
				});
			} else {
				throw new Error('No user was passed as an argument for creation.');
				next({
					success : false,
					message : 'No user was passed as an argument for creation.',
					value	: user,
					note	: 'If you received this in error, please notify the admin.'
				});
			}
		},
		
		save : function (user, next) {
			//console.log('\x1b[33musers.save query\x1b[0m');
			var query = 'UPDATE ' + mySql.config.users_table + ' SET ? WHERE id = ?';
			
			if ( user ) {
				mySql.query(query, [user, user.id], function (err, result) {
					if (err) {
						if (err.errno === 1062) {
							next(null, {
								success : false,
								message : 'That username is already in use.  Your changes have not been saved.'
							});
						} else {
							throw new Error(err);
							next(err);
						}
					} else if ( result.changedRows > 0 ) {
						next(null, {
							success : true,
							message : 'The user was updated successfully!'
						});
					} else {
						next(null, {
							success : false,
							message : 'No changes were made, nothing to save.'
						});
					}
				});
			} else {
				throw new Error('No user was passed as an argument for updating.');
				next({
					success : false,
					message : 'No user was passed as an argument for updating.',
					value	: user,
					note	: 'If you received this in error, please notify the admin.'
				});
			}
		},
		
		remove : function (userId, next) {
			//console.log('\x1b[33musers.save query\x1b[0m');
			
			if ( userId ) {
				var query = 'DELETE FROM ' + mySql.config.users_table + ' WHERE id = ?';
				mySql.query(query, userId, function (err, result) {
					if (err) {
						throw new Error(err);
					} else if ( result.affectedRows > 0 ) {
						next(null, {
							success : true,
							message : 'The user was deleted successfully!'
						});
					} else {
						next(null, {
							success : false,
							message : 'An error occured while deleting the user.'
						});
					}
				});
			} else {
				throw new Error('No user was passed as an argument for deletion!')
				next({
					success: false,
					message: 'No user was passed as an argument for deletion.',
					value  : userId,
					note   : 'If you received this in error, please notify the admin.'
				});
			}
		},
		
		hashPassword : function (password, next) {
			bcrypt.genSalt(10, function (err, salt) {
				if (err) 
					next(err);
				
				if (salt) {
					bcrypt.hash(password, salt, null, function (err, result) {
						if (err)
							next(err);
						
						if (result) {
							next(null, {
								salt: salt,
								password: result
							});
						} else {
							next(null, {
								success: false,
								message: 'Something went wrong when generating the final hash.',
								result : result
							});
						}
					});
				} else {
					next(null, {
						success: false,
						message: 'Something went wrong when creating the salt.',
					});
				}			
			});
		},
		
		setUser : function (method, req) {
			var User = {};

			if ( req.params.user_id )
				User.id = req.params.user_id;
 			
			if ( req.body.firstName ) {
				User.firstName = req.body.firstName;
			}
			
			if ( req.body.lastName ) {
				User.lastName = req.body.lastName;
			}
			
			if ( req.body.username ) {
				User.username = req.body.username;
			}
			
			if ( req.body.password ) {
				var salt = bcrypt.genSaltSync(10);
				var pass = bcrypt.hashSync(req.body.password, salt);
				User.password = pass;
			}
				
				
			if ( req.body.email ) {
				User.email = req.body.email;
			}
			
			if ( req.body.role ) 
				User.role = req.body.role;
			
			if ( method === 'create' ) {
				User.created_by = req.decoded.id;
			}
			
			if ( method === 'save' ) {
				User.updated_by = req.decoded.id;
			}
			
			if ( method === 'create' || method === 'save' ) {
				if ( method === 'create' && ( User.firstName && User.lastName && 
				    User.username && User.password && User.email) ) {
					return User;
				} else if ( method === 'save' && ( User.firstName && User.lastName && 
				           User.username && User.email )) {
					return User;
				} else {
					throw new Error('You must fill out all of the fields.\n' +
					                    'Required fields: Firstname, Lastname, Username, Password and Email');
					//return false;
				}
			} else {
				throw new Error('You must define the method: create / save');
				//return false;
			}
		}
	};
	
	mySql.db = {
		list : function (next) {
			var query = 'SELECT TABLE_NAME as tableName, TABLE_ROWS as tableRows, ' +
						'DATA_LENGTH as tableLength ' +
						'FROM INFORMATION_SCHEMA.tables ' +
						'WHERE TABLE_TYPE = "BASE TABLE" AND TABLE_SCHEMA = "zeph";';
			
			mySql.query(query, null, function (err, result) {
				if (err) {
					next(mySql.handleError(err), null);
				} else {
					next(null, {
						success : true,
						message : 'The table list was successfully retrieved.',
						data	: result
					});
				}
			});
		},
		
		table : function(table, next) {
			var query1 = 'SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.columns ' +
						 'WHERE TABLE_SCHEMA=' + Connection.escape(mySql.config.database) + ' AND TABLE_NAME=' + Connection.escape(table);
			var query2 = 'SELECT * FROM ' + table;
			
			mySql.query(query1, table, function (err, result1) {
				if (err) {
					next(mySql.handleError(err), null);
				} else {
					mySql.query(query2, table, function (err, result2) {
						if (err) {
							next(mySql.handleError(err), null);
						} else {							
							next(null, {
								success	: true,
								message	: 'The table data was successfully retrieved.',
								data	: {
									table	: table,
									columns	: result1,
									rows	: result2
								} 
							});
						}
					});
					
				}
			});
		}
	};
	
	mySql.bcrypt = bcrypt;

	return mySql;
}
