angular.module('epk',
			   [
					'app.routes',
					'ngAnimate',
					'authService',
					'mainCtrl'
			   ])
		.config(function($httpProvider) {
			$httpProvider.interceptors.push('AuthInterceptor');
		});
		