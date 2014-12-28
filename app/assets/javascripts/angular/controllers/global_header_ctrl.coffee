@GlobalHeaderCtrl = ($scope, $state, $translate, $stateParams, $cookies) ->

  # loading data

  $scope.formData = {}

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
    console.log $scope.formData.search_query

  # language

  $scope.setLanguage = ->
    $scope.data = {}
    $scope.data.locale = $cookies.locale || 'en'
    $translate.use $scope.data.locale

  $scope.setLanguage()

  $scope.changeLanguage = (key) ->
    $translate.use key
    $cookies.locale = $scope.data.locale = key

  # navigation

  $scope.navHome = ->
    $state.go('home')

@GlobalHeaderCtrl.$inject = ['$scope', '$state', '$translate', '$stateParams', '$cookies']
