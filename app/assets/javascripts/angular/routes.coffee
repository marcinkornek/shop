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

    # User
    .state('register', {
      url: '/register',
      data: {
        roles: []
      },
      views: {
        "header":     { controller: 'GlobalHeaderCtrl', templateUrl: 'global/header.html' },
        "body":       { controller: 'UserNewCtrl',      templateUrl: 'users/user_new.html' },
      }
    })
    .state('user_edit', {
      url: '/account/edit',
      data: {
        roles: ['user', 'admin']
      },
      views: {
        "header":     { controller: 'GlobalHeaderCtrl',  templateUrl: 'global/header.html' },
        "body":       { controller: 'UserEditCtrl',      templateUrl: 'users/user_edit.html' },
        "user_data@user_edit":    { controller: 'UserEditDataCtrl',    templateUrl: 'users/user_edit.user_data.html' },
        "user_address@user_edit": { controller: 'UserEditAddressCtrl', templateUrl: 'users/user_edit.user_address.html' },
        "user_change_password@user_edit": { controller: 'UserEditChangePasswordCtrl', templateUrl: 'users/user_edit.user_change_password.html' },
      }
    })
