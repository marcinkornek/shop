@SessionNewCtrl = ($scope, $state, sessionData, principal) ->

  # function

  $scope.principal = principal
  $scope.show = false

  $scope.showMe = ->
    if $scope.show == false
      $scope.show = true
    else
      $scope.show = false

  $scope.createSession = ->
    if $scope.formData.email && $scope.formData.password
      sessionData.save({}, $scope.formData
        , (success) ->
          console.log 'success'
          console.log success.user
          window.currentUser = success.user
          console.log 'role = ', success.user.role
          principal.authenticate(success.user.role)
          if ($scope.returnToState)
            $state.go($scope.returnToState.name, $scope.returnToStateParams)
          else
            $state.go('home')
        , (error) ->
          console.log 'error'
          $scope.formData.data_error = error.data.error if error.data
      )

  # navigation

  $scope.navRegister = ->
    $state.go('register')

@SessionNewCtrl.$inject = ['$scope', '$state', 'sessionData', 'principal']

