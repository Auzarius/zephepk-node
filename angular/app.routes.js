angular.module('app.routes', ['ngRoute'])
	.config(function ($routeProvider, $locationProvider) {
		$routeProvider
			.when('/admin', {
				templateUrl : './views/home.html'
			})
			
			.when('/admin/login', {
				templateUrl : './views/login.html',
				controller  : 'mainController',
				controllerAs: 'login'
			})
			
			.when('/admin/users', {
				templateUrl : './views/users/all.html',
				controller  : 'userController',
				controllerAs: 'user'
			})
			
			.when('/admin/users/new', {
				templateUrl : './views/users/create.html',
				controller  : 'userCreateController',
				controllerAs: 'user'
			})
			
			.when('/admin/users/:userId', {
				templateUrl : './views/users/edit.html',
				controller  : 'userEditController',
				controllerAs: 'user'
			})
			
			.when('/admin/profile', {
				templateUrl : './views/users/profile.html',
				controller  : 'userProfileController',
				controllerAs: 'user'
			})
			
			.when('/admin/db', {
				
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
	