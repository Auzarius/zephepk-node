"use strict";

module.exports = function (app, express, mySql) {
	var apiDB = express.Router();
	
	apiDB.route('/')
		.get(function (req, res) {
			mySql.db.list(function (err, result) {
				if (err) {
					res.status(500).json({
						status	: 500,
						error	: err,
						message	: 'Something went wrong when retrieving the database list.',
						data	: null
					});
				} else {
					res.status(200).json({
						status	: 200,
						error	: null,
						message	: 'Table listing was successfully retrieved from the database.',
						data	: result.data
					});
				}
			});
		});
		
	apiDB.route('/:table')
		.get(function (req, res) {
			mySql.db.table(req.params.table, function (err, result) {
				if (err) {
					res.status(500).json({
						status	: 500,
						error	: err,
						message	: 'Something went wrong when retrieving the data from the table.',
						data	: null
					});
				} else {
					res.status(200).json({
						status	: 200,
						error	: null,
						message	: 'Table data was successfully retrieved from the database.',
						data	: result.data
					});
				}
			});
		});
		
	apiDB.route('/:table/:id')
		.get(function (req, res) {
			res.status(200).json({
				status	: 200,
				error	: null,
				message	: 'This is not yet written.',
				data	: null
			});
		});
		
	return apiDB;
}
