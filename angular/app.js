angular.module('epk',
			   [
					'app.routes',
					'ngAnimate',
					//'xeditable',
					'authService',
					'mainCtrl'
			   ])
		.config(function($httpProvider) {
			$httpProvider.interceptors.push('AuthInterceptor');
		});
		
		