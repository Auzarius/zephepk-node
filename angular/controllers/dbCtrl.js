angular.module('dbCtrl', ['dbService'])

.controller('tablesController', function($scope, Database) {
	
	var vm = this;
	vm.processing = true;
	
	Database.tables.get()
		.success(function (apiResult) {
			vm.data = apiResult.data;
			vm.processing = false;
		})
		.error(function (apiResult) {
			if (apiResult) {
				vm.message = apiResult.message;
			}
			
			vm.data = null;
			vm.processing = false;
		});
						
	vm.deleteTable = function(tableName) {
		vm.processing = true;
		
		Database.table.delete(tableName)
			.success(function (api) {
				if (api.success) {
					Database.tables.get()
						.success(function (apiResult) {
							vm.data = apiResult.data;
						});
				}
				
				vm.processing = false;
				vm.message = api.message;
			});
	};
	
})

.controller('tableController', function($scope, $routeParams, Database) {
	
	var vm = this;
	vm.processing = true;
	
	$scope.noSort = function(obj){
        if (!obj) {
            return [];
        }
		
		if (obj['$$hashKey']) {
			delete obj['$$hashKey'];
		}
		
		return Object.keys(obj);
    };
	
	$scope.isNumber = angular.isNumber;
	
	$scope.isDate = function(val) {
		var date = Date.parse(val);
		
		if(isNaN(date))
			return false;
		else if (val.toString().length < 10)
			return false;
		else
		 	return true;
	};

	$scope.getType = function(myVar) {
		return typeof myVar;
	};
	
	Database.table.get($routeParams.table)
		.success(function (apiResult) {
			vm.data = apiResult.data;
			vm.processing = false;
			console.log(apiResult.data);
		})
		.error(function (apiResult) {
			if (apiResult) {
				vm.message = apiResult.message;
			}
			
			vm.data = null;
			vm.processing = false;
		});
		
	vm.deleteRow = function(tableRow) {
		vm.processing = true;
		
		Database.row.delete(tableRow)
			.success(function (api) {
				if (api.success) {
					Database.table.get()
						.success(function (apiResult) {
							vm.data = apiResult.data;
						});
				}

				vm.processing = false;
				vm.message = api.message;
			});
	};
	
});