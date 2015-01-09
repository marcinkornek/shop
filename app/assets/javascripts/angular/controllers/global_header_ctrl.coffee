GlobalHeaderCtrl = ($scope, $state, $translate, $stateParams, $cookies, sessionData, principal) ->

  # loading data 1/2

  $scope.formData = {}

  $scope.loadCategories = ->
    $scope.data.categories = window.categories if window.categories
    $scope.data.main_category = $stateParams.main_category
    $scope.data.category_type = $stateParams.category_type
    $scope.data.category = $stateParams.category

  $scope.loadSearchQuery = ->
    $scope.formData.search_query = $stateParams.searchQuery

  $scope.loadSearchQuery()

  # functions

  $scope.searchShow = ->
    if $scope.data.search == 1 && $scope.formData.search_query
      $scope.searchQuery()
    if $scope.data.search != 1
      $scope.data.search = 1

  $scope.searchQuery = ->
    $state.go('products_search', {searchQuery: $scope.formData.search_query})

  $scope.destroySession = ->
    sessionData.delete((response) ->
      $scope.data = {}
      window.currentUser = {}
      principal.authenticate(null)
      $state.go('home', {}, {reload: true})
    )

  # language

  $scope.setLanguage = ->
    $scope.data = {}
    $scope.data.locale = $cookies.locale || 'en'
    $translate.use $scope.data.locale

  $scope.setLanguage()

  $scope.changeLanguage = (key) ->
    $translate.use key
    $cookies.locale = $scope.data.locale = key

  # loading data 2/2

  $scope.loadData = ->
    $scope.data.user =  window.currentUser
    $scope.data.locale = $cookies.locale || 'pl'
    $scope.loadCategories()
    if $stateParams.searchQuery
      $scope.data.search = 1

  $scope.loadData()

angular.module("shop").controller "GlobalHeaderCtrl", GlobalHeaderCtrl
GlobalHeaderCtrl.$inject = ["$scope", "$state", "$translate", "$stateParams", "$cookies", "sessionData", "principal"]
