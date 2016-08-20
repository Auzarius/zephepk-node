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
		.config(function($httpProvider) {
			$httpProvider.interceptors.push('AuthInterceptor');
		})
		.run(function(editableOptions) {
			editableOptions.theme = 'bs3'; // bootstrap3 theme. Can be also 'bs2', 'default'
		});
		
		