angular.module('shop').config ($stateProvider, $urlRouterProvider) ->
  $urlRouterProvider.otherwise('/');

  $stateProvider
    .state('home', {
      url: '/',
      views: {
        "header":     { controller: 'GlobalHeaderCtrl', templateUrl: 'global/header.html' }
      }
    })
#       data: {
#         roles: ['User', 'Admin']
#       }
#       views: {
#         "header":     { controller: 'GlobalHeaderCtrl', templateUrl: 'header/header.html' }
#         "navigation": { controller: 'GlobalNavigationCtrl', templateUrl: 'navigation/navigation.html' }
#         "body":       { controller: 'ProductsIndexCtrl',  templateUrl: 'body/products/products_index.html' }
#         "order":      { controller: 'OrderSummaryCtrl',  templateUrl: 'body/orders/orders_index.html' }
#       }
    # })

#     # User
#     .state('sign_up', {
#       url: '/users/new',
#       data: {
#         roles: []
#       },
#       views: {
#         "header":     { controller: 'GlobalHeaderCtrl', templateUrl: 'header/header.html' },
#         "body":       { controller: 'UserNewCtrl',   templateUrl: 'body/users/user_new.html' },
#         "errors@sign_up": { templateUrl: 'body/users/user_new.errors.html' },
#       }
#     })
#     .state('users_index', {
#       url: '/users',
#       data: {
#         roles: ['Admin']
#       },
#       views: {
#         "header":     { controller: 'GlobalHeaderCtrl', templateUrl: 'header/header.html' }
#         "navigation": { controller: 'GlobalNavigationCtrl', templateUrl: 'navigation/navigation.html' }
#         "body":       { controller: 'UsersIndexCtrl',     templateUrl: 'body/users/users_index.html' }
#       }
#     })
#     .state('user_show', {
#       url: '/users/:userId',
#       data: {
#         roles: ['User', 'Admin']
#       },
#       views: {
#         "header":     { controller: 'GlobalHeaderCtrl', templateUrl: 'header/header.html' }
#         "navigation": { controller: 'GlobalNavigationCtrl', templateUrl: 'navigation/navigation.html' }
#         "body":       { controller: 'UserShowCtrl',     templateUrl: 'body/users/user_show.html' }
#       }
#     })
