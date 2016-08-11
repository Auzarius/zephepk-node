module.exports = function(app, express, mySql) {
	var adminRouter = express.Router();
	
	adminRouter.get('/', function (req, res) {
		console.log('You landed on the admin home page.');
		res.json({
			success	: true,
			status	: 200,
			data	: {},
			message : 'Welcome to the admin home page.'
		});
	});
	
	return mainRouter;
}
