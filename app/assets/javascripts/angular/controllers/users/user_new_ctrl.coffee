UserNewCtrl = ($scope, $state, userData, principal) ->

  # function

  $scope.principal = principal

  $scope.createUser = ->
    if $scope.formData.first_name && $scope.formData.last_name && $scope.formData.email && $scope.formData.password && $scope.formData.password_confirmation
      userData.save({}, $scope.formData
        , (success) =>
          console.log 'success'
          $state.go('login')
        , (error) ->
          console.log 'error'
          console.log error
      )

  $scope.open = ($event) ->
    $event.preventDefault()
    $event.stopPropagation()
    $scope.opened = true

angular.module("shop").controller "UserNewCtrl", UserNewCtrl
UserNewCtrl.$inject = ["$scope", "$state", "userData", "principal"]
