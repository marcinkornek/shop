SessionNewCtrl = ($scope, $state, sessionData, principal) ->

  # function

  $scope.principal = principal

  $scope.createSession = ->
    if $scope.formData.email && $scope.formData.password
      sessionData.save({}, $scope.formData
        , (success) ->
          console.log 'success'
          console.log success.user
          window.currentUser = success.user
          console.log 'role = ', success.user.role
          principal.authenticate(success.user.role)
          # friendly forwarding
          if ($scope.returnToState)
            $state.go($scope.returnToState.name, $scope.returnToStateParams)
          else
            $state.go('home')
        , (error) ->
          console.log 'error'
          $scope.addAlert('danger', error.data.error) if error.data
      )

  $scope.alerts ||= []

  $scope.addAlert = (type, message) ->
    $scope.closeAlert()
    $scope.alerts.push { type: type, error: message }

  $scope.closeAlert = (index) ->
    $scope.alerts.splice index, 1

angular.module("shop").controller "SessionNewCtrl", SessionNewCtrl
SessionNewCtrl.$inject = ["$scope", "$state", "sessionData", "principal"]
