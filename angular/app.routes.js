angular.module('app.routes', ['ngRoute'])
	.config(function ($routeProvider, $locationProvider) {
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
	});
	