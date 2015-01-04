SessionNewPasswordCtrl = ($scope, $state, $stateParams, userData, $timeout) ->

  # function

  $scope.formData = {}

  $scope.setNewPassword = ->
    $scope.formData.token = $stateParams.token
    if $scope.formData.password && $scope.formData.password_confirmation && $scope.formData.password == $scope.formData.password_confirmation && $scope.formData.token
      console.log $scope.formData
      userData.set_new_password({}, $scope.formData
        , (success) ->
          console.log 'success'
          console.log success
          $scope.addAlert('success', 'PASSWORD_RESET_ALERT_SUCCESS')
          $timeout (->
            $state.go('login')
          ), 3000
        , (error) ->
          console.log 'error'
          console.log error
          $scope.addAlert('danger', 'PASSWORD_RESET_ALERT_DANGER')
      )

  $scope.alerts ||= []

  $scope.addAlert = (type, message) ->
    $scope.closeAlert()
    $scope.alerts.push { type: type, error: message }

  $scope.closeAlert = (index) ->
    $scope.alerts.splice index, 1

angular.module("shop").controller "SessionNewPasswordCtrl", SessionNewPasswordCtrl
SessionNewPasswordCtrl.$inject = ["$scope", "$state", "$stateParams", "userData", "$timeout"]
