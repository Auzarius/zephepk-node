module.exports = function(app, express, mySql) {
	var mainRouter = express.Router();
	
	mainRouter.get('/', function (req, res) {
		mySql.getTourData(function (err, shows) {
			if (err) {
				res.render("index");
			} else {
				var data = {};
				data.shows = shows;
				console.log("Data: " + data.shows);
				
				mySql.getAlbumData('Stories from the Book of Metal', function(err, album1) {
					if (err) {
						res.render("index", data);
					} else {
						data.album1 = album1;
						console.log("Data: " + data.album1);
						mySql.getAlbumData('Reforged', function(err, album2) {
							if (err) {
								res.render("index", data);
							} else {
								data.album2 = album2;
								console.log("Data: " + data.album2);
								res.render("index", data);
							}
						});
					}
				});
			}
		});
	});
	
	return mainRouter;
}
