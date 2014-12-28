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
          # user authorization
          console.log 'role = ', success.user.role
          principal.authenticate(success.user.role)
            # username: success.user.username
            # roles: [ "User" ]
          # friendly forwarding
          if ($scope.returnToState)
            $state.go($scope.returnToState.name, $scope.returnToStateParams)
          else
            $state.go('home')
        , (error) ->
          console.log 'error'
          # console.log error.data
          $scope.formData.data_error = error.data.error if error.data
      )

@SessionNewCtrl.$inject = ['$scope', '$state', 'sessionData', 'principal']

