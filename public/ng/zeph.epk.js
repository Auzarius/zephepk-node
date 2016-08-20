angular.module('epk',
			   [
					'xeditable',
					'app.routes',
					'ngAnimate',
					'authService',
					'mainCtrl',
					'dbCtrl',
					'dbService'
			   ])
		.config(["$httpProvider", function($httpProvider) {
			$httpProvider.interceptors.push('AuthInterceptor');
		}])
		.run(["editableOptions", function(editableOptions) {
			editableOptions.theme = 'bs3'; // bootstrap3 theme. Can be also 'bs2', 'default'
		}]);
		
		
angular.module('app.routes', ['ngRoute'])
	.config(["$routeProvider", "$locationProvider", function ($routeProvider, $locationProvider) {
		$routeProvider
			.when('/admin', {
				templateUrl : './views/home.html'
			})
			
			.when('/admin/login', {
				templateUrl : './views/users/login.html',
				controller  : 'mainController',
				controllerAs: 'login'
			})
			
			.when('/admin/users', {
				templateUrl : './views/users/all.html',
				controller  : 'mainController',
				controllerAs: 'main'
				//controller  : 'userController',
				//controllerAs: 'user'
			})
			
			.when('/admin/users/new', {
				templateUrl : './views/users/create.html',
				controller  : 'mainController',
				controllerAs: 'main'
				//controller  : 'userCreateController',
				//controllerAs: 'user'
			})
			
			.when('/admin/users/:userId', {
				templateUrl : './views/users/edit.html',
				controller  : 'mainController',
				controllerAs: 'main'
				//controller  : 'userEditController',
				//controllerAs: 'user'
			})
			
			.when('/admin/profile', {
				templateUrl : './views/users/profile.html',
				controller  : 'mainController',
				controllerAs: 'main'
				//controller  : 'userProfileController',
				//controllerAs: 'user'
			})
			
			.when('/admin/db', {
				templateUrl	: './views/db/index.html',
				controller 	: 'tablesController',
				controllerAs: 'tables'
			})
			
			.when('/admin/db/:table', {
				templateUrl	: './views/db/table.html',
				controller 	: 'tableController',
				controllerAs: 'table'
			})
			
			.when('/admin/whoa-bro', {
				templateUrl : './views/403.html',
				controller  : 'mainController',
				controllerAs: 'main'
			})
			
			.otherwise({
				redirectTo: '/admin'
			});
			
			$locationProvider.html5Mode(true);
	}]);
	
angular.module('dbCtrl', ['dbService'])

.controller('tablesController', ["$scope", "Database", function($scope, Database) {
	
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
	
}])

.controller('tableController', ["$scope", "$routeParams", "Database", function($scope, $routeParams, Database) {
	
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
	
}]);
angular.module('mainCtrl', ['angularMoment'])

.controller('mainController', ["$rootScope", "$location", "Auth", function($rootScope, $location, Auth) {

	var vm = this;

	// get info if a person is logged in
	vm.loggedIn = Auth.isLoggedIn();
	
	
	// check to see if a user is logged in on every request
	$rootScope.$on('$routeChangeStart', function(event) {
		vm.loggedIn = Auth.isLoggedIn();
		
		if (vm.loggedIn) {
			vm.location = $location.path();
			Auth.getUser()
			.then(function(node) {
				vm.user = node.data
			});	
			
			if ( $location.path() == '/admin/login' ) {
				$location.path('/admin');
			}
			
		} else if ( $location.path() == '/admin/login' ) {
			// do nothing;
		} else {
			$location.path('/admin/login');
		}
		// get user information on page load
		
	});
	
	// resets the view to the top of the page when a new route loads
	// this prevents the view focus from staying the same from page to page
	$rootScope.$on('$routeChangeSuccess',function() { 
		$("html, body").animate({ scrollTop: 0 }, 100); 
	});

	// function to handle login form
	vm.doLogin = function() {
		vm.processing = true;

		// clear the error
		vm.error = '';

		Auth.login(vm.loginData.username, vm.loginData.password)
			.success(function(data) {
				vm.processing = false;			
				
				vm.user = vm.loginData.username;
				
				// if a user successfully logs in, redirect to tickets page
				if (data.success)			
					$location.path('/');
				else 
					vm.error = data.message;
				
			});
	};

	// function to handle logging out
	vm.doLogout = function() {
		Auth.logout();
		vm.user = null;
		
		$location.path('/admin/login');
	};

}]);

// Courtesy of Scotch.io Chris Sevilleja & Holly Lloyd
// http://leanpub.com/mean-machine

angular.module('authService', [])

// ===================================================
// auth factory to login and get information
// inject $http for communicating with the API
// inject $q to return promise objects
// inject AuthToken to manage tokens
// ===================================================
.factory('Auth', ["$http", "$q", "AuthToken", function($http, $q, AuthToken) {

	// create auth factory object
	var authFactory = {};

	// log a user in
	authFactory.login = function(username, password) {

		// return the promise object and its data
		return $http.post('/api/authenticate', {
			username: username,
			password: password
		})
			.success(function(data) {
				AuthToken.setToken(data.token);
       			return data;
			});
	};

	// log a user out by clearing the token
	authFactory.logout = function() {
		// clear the token
		AuthToken.setToken();
	};

	// check if a user is logged in
	// checks if there is a local token
	authFactory.isLoggedIn = function() {
		if (AuthToken.getToken()) 
			return true;
		else
			return false;	
	};

	// get the logged in user
	authFactory.getUser = function() {
		if (AuthToken.getToken())
			return $http.get('/api/me', { cache: false });
		else
			return $q.reject({ message: 'User has no token.' });		
	};

	// return auth factory object
	return authFactory;

}])

// ===================================================
// factory for handling tokens
// inject $window to store token client-side
// ===================================================
.factory('AuthToken', ["$window", function($window) {

	var authTokenFactory = {};

	// get the token out of local storage
	authTokenFactory.getToken = function() {
		return $window.localStorage.getItem('token');
	};

	// function to set token or clear token
	// if a token is passed, set the token
	// if there is no token, clear it from local storage
	authTokenFactory.setToken = function(token) {
		if (token)
			$window.localStorage.setItem('token', token);
	 	else
			$window.localStorage.removeItem('token');
	};

	return authTokenFactory;

}])

// ===================================================
// application configuration to integrate token into requests
// ===================================================
.factory('AuthInterceptor', ["$q", "$location", "AuthToken", function($q, $location, AuthToken) {

	var interceptorFactory = {};

	// this will happen on all HTTP requests
	interceptorFactory.request = function(config) {

		// grab the token
		var token = AuthToken.getToken();

		// if the token exists, add it to the header as x-access-token
		if (token) 
			config.headers['x-access-token'] = token;
		
		return config;
	};

	// happens on response errors
	interceptorFactory.responseError = function(response) {

		// if our server returns a 403 forbidden response
		if (response.status == 401) {
			AuthToken.setToken();
			$location.path('/admin/login');
		} else if (response.status == 403) {
			$location.path('/forbidden');
		}

		// return the errors from the server as a promise
		return $q.reject(response);
	};

	return interceptorFactory;
	
}]);
angular.module('dbService', [])

.factory('Database', ["$http", function($http) {
	
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
}]);

