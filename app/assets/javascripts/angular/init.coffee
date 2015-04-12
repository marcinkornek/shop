angular.module('shop', [
  'ui.router',
  'jmdobry.angular-cache',
  'pascalprecht.translate',
  'ngResource',
  'ui.bootstrap',
  'ngAnimate',
  'ngCookies',
  'ngTouch',
  'angular-carousel',
  'infinite-scroll',
  'ngDialog',
])
  .factory 'railsLocalesLoader', ($http) ->
    (options) ->
      $http.get("locales/#{options.key}.json").then (response) ->
        response.data
      , (error) ->
        throw options.key

  .config ($provide, $httpProvider, $translateProvider, Rails) ->

    # Template cache
    if Rails.env != 'development'
      $provide.service '$templateCache', ['$angularCacheFactory', ($angularCacheFactory) ->
        $angularCacheFactory('templateCache', {
          maxAge: 3600000 * 24 * 7,
          storageMode: 'localStorage',
          recycleFreq: 60000
        })
      ]

    # Assets interceptor
    $provide.factory 'railsAssetsInterceptor', ($angularCacheFactory) ->
      request: (config) ->
        if assetUrl = Rails.templates[config.url]
          config.url = assetUrl
        config

    $httpProvider.interceptors.push('railsAssetsInterceptor')

    # Angular translate
    $translateProvider.useLoader('railsLocalesLoader')
    $translateProvider.preferredLanguage('pl')

angular.module("shop").config (datepickerConfig, datepickerPopupConfig) ->
  datepickerPopupConfig.showButtonBar = false
  datepickerConfig.showWeeks = false

angular.module("shop").config ($locationProvider) ->
  $locationProvider.html5Mode true

# ###
# http://stackoverflow.com/a/22540482/3922041
# ###

# coffeelint: disable=max_line_length
angular.module('shop').run([ "$rootScope", "$state", "$stateParams", "authorization", "principal", ($rootScope, $state, $stateParams, authorization, principal) ->
# coffeelint: enable=max_line_length
  $rootScope.$on "$stateChangeStart", (event, toState, toParams, fromState, fromParams) ->
    # console.log "toState.name: " + toState.name
    # console.log "fromState.name: " + fromState.name
    # console.log "----------------------"
    $rootScope.toState = toState
    $rootScope.toStateParams = toParams
    # console.log window.currentUser.id
    if window.currentUser.id
      principal.authenticate
        username: window.currentUser.username
        roles: [ window.currentUser.role ]
    else
      principal.authenticate(null)
      # console.log 'false'
    authorization.authorize()
  $rootScope.$on "$stateChangeSuccess", (event, toState, toParams, fromState, fromParams) ->
    # console.log 'success'
])

 # ui-bootstrap tooltip animation is broken using angular 1.3
angular.module("shop").config [ "$tooltipProvider", ($tooltipProvider) ->
  $tooltipProvider.options animation: false
]
