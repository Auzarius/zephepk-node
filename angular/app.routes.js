angular.module('app.routes', ['ngRoute'])
	.config(function ($routeProvider, $locationProvider) {
		$routeProvider
			.when('/', {
				templateUrl : './views/home.html'
			})
			
			.when('/login', {
				templateUrl : './views/login.html',
				controller  : 'mainController',
				controllerAs: 'login'
			})
			
			.when('/users', {
				templateUrl : './views/users/all.html',
				controller  : 'userController',
				controllerAs: 'user'
			})
			
			.when('/users/new', {
				templateUrl : './views/users/create.html',
				controller  : 'userCreateController',
				controllerAs: 'user'
			})
			
			.when('/users/:userId', {
				templateUrl : './views/users/edit.html',
				controller  : 'userEditController',
				controllerAs: 'user'
			})
			
			.when('/profile', {
				templateUrl : './views/users/profile.html',
				controller  : 'userProfileController',
				controllerAs: 'user'
			})
			
			.when('/whoa-bro', {
				templateUrl : './views/403.html',
				controller  : 'mainController',
				controllerAs: 'main'
			})
			
			.otherwise({
				redirectTo: '/'
			});
			
			$locationProvider.html5Mode(true);
	});
	