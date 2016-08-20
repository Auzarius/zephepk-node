angular.module('dbService', [])

.factory('Database', function($http) {
	
	var dbFactory = {};
	
	dbFactory.tables = {
		get : function() {
			return $http.get('/api/db');
		}
	};
	
	dbFactory.table = {
		get : function(tableName) {
			return $http.get('/api/db/' + tableName);
		},
		
		delete : function(tableName) {
			return $http.delete('/api/db' + tableName);
		}
	};
	
	return dbFactory;
});
