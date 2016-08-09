module.exports = function(app, express, mySql) {
	var mainRouter = express.Router();
	
	mainRouter.get('/', function (req, res) {
		res.render("index", {});
	});
	
	return mainRouter;
}
