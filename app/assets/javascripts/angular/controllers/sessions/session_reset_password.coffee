SessionResetPasswordCtrl = ($scope, $state, userData, $timeout) ->

  # function

  $scope.formData = {}

  $scope.resetPassword = ->
    if $scope.formData.email
      userData.reset_password({}, $scope.formData
      , (success) ->
        $scope.addAlert('success', { message: 'PASSWORD_RESET_EMAIL_ALERT_SUCCESS' })
        $timeout (->
          $state.go('login')
        ), 3000
      , (error) ->
        console.log 'error'
        $scope.addAlert('danger', error.data.error) if error.data.error
      )

  $scope.alerts ||= []

  $scope.addAlert = (type, message) ->
    $scope.closeAlert()
    $scope.alerts.push { type: type, error: message }

  $scope.closeAlert = (index) ->
    $scope.alerts.splice index, 1

angular.module("shop").controller "SessionResetPasswordCtrl", SessionResetPasswordCtrl
SessionResetPasswordCtrl.$inject = ["$scope", "$state", "userData", "$timeout"]
