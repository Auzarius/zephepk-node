module.exports = function(app, express, mySql) {
	var mainRouter = express.Router();
	
	mainRouter.get('/', function (req, res) {
		mySql.getTourData(function (err, result) {
			if (err) {
				res.render("index");
			} else {
				res.render("index", { shows: result });
			}
		});
	});
	
	return mainRouter;
}
