UserNewCtrl = ($scope, $state, userData, principal) ->

  # function

  $scope.formData = {}
  $scope.principal = principal

  $scope.createUser = ->
    if $scope.isFormValid()
      userData.save({}, $scope.formData
      , (success) ->
        $state.go('login')
      , (error) ->
        console.log 'error'
        console.log error
      )

  $scope.isFormValid = ->
    $scope.formData.first_name && $scope.formData.last_name && $scope.formData.email \
      && $scope.formData.password && $scope.formData.password_confirmation && true

  # datepicker

  $scope.open = ($event) ->
    $event.preventDefault()
    $event.stopPropagation()
    $scope.opened = true

  $scope.dateOptions =
    formatYear: "yyyy"
    startingDay: 1

angular.module("shop").controller "UserNewCtrl", UserNewCtrl
UserNewCtrl.$inject = ["$scope", "$state", "userData", "principal"]
