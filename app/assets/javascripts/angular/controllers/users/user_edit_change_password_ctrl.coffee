UserEditChangePasswordCtrl = ($scope, $state, userData) ->

  # functions

  $scope.changePassword = ->
    if $scope.formData.password.old_password && $scope.formData.password.new_password && $scope.formData.password.new_password_confirmation && $scope.formData.password.new_password_confirmation == $scope.formData.password.new_password
      password = $scope.formData.password
      userData.change_password({}, password
        , (success) =>
          $scope.clearPasswordForm()
          $scope.addAlert('success', 1)
        , (error) ->
          console.log 'error'
          $scope.addAlert('danger', 2)
      )

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