UserEditChangePasswordCtrl = ($scope, $state, userData) ->

  # functions

  $scope.changePassword = ->
    if $scope.isFormValid()
      password = $scope.formData.password
      userData.change_password({}, password
      , (success) ->
        $scope.clearPasswordForm()
        $scope.addAlert('success', 'USER_EDIT_CHANGE_PASSWORD_ALERT_SUCCESS')
      , (error) ->
        console.log 'error'
        $scope.addAlert('danger', 'USER_EDIT_CHANGE_PASSWORD_ALERT_DANGER')
      )

  $scope.isFormValid = ->
    $scope.formData.password.old_password && $scope.formData.password.new_password \
      && $scope.formData.password.new_password_confirmation \
      && $scope.formData.password.new_password_confirmation == $scope.formData.password.new_password

  $scope.clearPasswordForm = ->
    $scope.formData.password.old_password = ''
    $scope.formData.password.new_password = ''
    $scope.formData.password.new_password_confirmation = ''
    $scope.changePasswordForm.$setPristine()
    $scope.changePasswordForm.$setUntouched()

  # alerts

  $scope.alerts ||= []

  $scope.addAlert = (type, message) ->
    # console.log 'addAlert', type, message
    $scope.closeAlert()
    $scope.alerts.push { type: type, message: message }

  $scope.closeAlert = (index) ->
    $scope.alerts.splice index, 1

angular.module("shop").controller "UserEditChangePasswordCtrl", UserEditChangePasswordCtrl
UserEditChangePasswordCtrl.$inject = ["$scope", "$state", "userData"]
