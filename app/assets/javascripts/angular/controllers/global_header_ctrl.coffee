@GlobalHeaderCtrl = ($scope, $state, $translate, $stateParams, $cookies) ->

  # loading data

  # functions

  # language

  $scope.setLanguage = ->
    $scope.data = {}
    $scope.data.locale = $cookies.locale
    $translate.use $scope.data.locale

  $scope.setLanguage()

  $scope.changeLanguage = (key) ->
    $translate.use key
    $cookies.locale = $scope.data.locale = key

  # navigation

  $scope.navHome = ->
    $state.go('home')

@GlobalHeaderCtrl.$inject = ['$scope', '$state', '$translate', '$stateParams', '$cookies']
