angular.module('shop', [
  'ui.router',
  'jmdobry.angular-cache',
  'pascalprecht.translate',
  'ngResource',
  'ui.bootstrap',
  'ngAnimate',
  'ngCookies',
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
