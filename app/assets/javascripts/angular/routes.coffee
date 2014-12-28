angular.module('shop').config ($stateProvider, $urlRouterProvider) ->
  $urlRouterProvider.otherwise('/');

  $stateProvider
    .state('home', {
      url: '/',
      data: {
        roles: []
      },
      views: {
        "header":     { controller: 'GlobalHeaderCtrl', templateUrl: 'global/header.html' }
      }
    })

    # Sessions
    .state('login', {
      url: '/login',
      data: {
        roles: []
      },
      views: {
        "header": { controller: 'GlobalHeaderCtrl',   templateUrl: 'global/header.html' }
        "body":   { controller: 'SessionNewCtrl',     templateUrl: 'sessions/session_new.html' }
      }
    })
