#= require application
#= require jasmine
#= require jasmine-ajax
#= require jasmine-jquery
#= require angular-mocks
#= require_tree ./

shared = angular.module('shop')
shared.constant('Rails', { env: 'dev', templates: {} })

beforeEach ->
  module('shop', ($provide, $translateProvider) ->
    $provide.factory 'customLoader', ($q) ->
      ->
        deferred = $q.defer()
        deferred.resolve {}
        deferred.promise

    $translateProvider.useLoader 'customLoader'
    return
  )
