# coffeelint: disable=max_line_length
angular.module('shop').config ($stateProvider, $urlRouterProvider) ->
  $urlRouterProvider.otherwise('/')

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
    .state('user_reset_password', {
      url: '/reset_password',
      data: {
        roles: []
      },
      views: {
        "header":     { controller: 'GlobalHeaderCtrl',         templateUrl: 'global/header.html' },
        "body":       { controller: 'SessionResetPasswordCtrl', templateUrl: 'sessions/session_reset_password.html' },
      }
    })
    .state('user_new_password', {
      url: '/new_password/:token',
      data: {
        roles: []
      },
      views: {
        "header":     { controller: 'GlobalHeaderCtrl',       templateUrl: 'global/header.html' },
        "body":       { controller: 'SessionNewPasswordCtrl', templateUrl: 'sessions/session_new_password.html' },
      }
    })

    # Products
    .state('products_index', {
      url: '/:main_category/:category_type/:category',
      data: {
        roles: []
      },
      views: {
        "header":     { controller: 'GlobalHeaderCtrl',  templateUrl: 'global/header.html' },
        "body":       { controller: 'ProductsIndexCtrl', templateUrl: 'products/products_index.html' },
      }
    })
    .state('products_show', {
      url: '/:main_category/:category_type/:category/:code/:color',
      data: {
        roles: []
      },
      views: {
        "header":     { controller: 'GlobalHeaderCtrl', templateUrl: 'global/header.html' },
        "body":       { controller: 'ProductShowCtrl',  templateUrl: 'products/product_show.html' },
      }
    })
    .state('products_search', {
      url: '/search/:searchQuery',
      data: {
        roles: []
      },
      views: {
        "header":     { controller: 'GlobalHeaderCtrl', templateUrl: 'global/header.html' }
        "body":       { controller: 'ProductsSearchCtrl',  templateUrl: 'products/products_index.html' }
      }
    })
