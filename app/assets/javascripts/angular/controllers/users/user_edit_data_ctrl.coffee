UserEditDataCtrl = ($scope, $stateParams, $state, userData, addressData, $http) ->

  # functions

  $scope.editUser = (userId) ->
    if $scope.formData.email && $scope.formData.first_name && $scope.formData.last_name
      user = $scope.formData
      userData.update({id: userId}, user
        , (success) =>
          $scope.editUserForm.$setPristine()
          $scope.editUserForm.$setUntouched()
          $scope.addAlert('success')
          window.currentUser.first_name = success.first_name
        , (error) ->
          console.log 'error'
          $scope.formData.user_error = error.data.error
      )

  # datepicker

  $scope.open = ($event) ->
    $event.preventDefault()
    $event.stopPropagation()
    $scope.opened = true

  # alerts

  $scope.alerts ||= []

  $scope.addAlert = (type, message) ->
    $scope.closeAlert()
    $scope.alerts.push { type: type, message: message }

  $scope.closeAlert = (index) ->
    $scope.alerts.splice index, 1

angular.module("shop").controller "UserEditDataCtrl", UserEditDataCtrl
UserEditDataCtrl.$inject = ["$scope", "$stateParams", "$state", "userData", "addressData", "$http"]
