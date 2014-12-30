UserEditCtrl = ($scope, $stateParams, $state, userData) ->

  # temporary data

  $scope.loadTemporaryUser = ->
    $scope.formData =
      first_name: 'Loading..'
      last_name: 'Loading..'
      email: 'Loading..'
      tel_num: 'Loading..'
      birth_date: 'Loading..'

  # loading data

  $scope.loadUser = ->
    userData.get({id: 1}
      , (user) ->
        console.log user
        $scope.formData.id = user.id
        $scope.formData.first_name = user.first_name
        $scope.formData.last_name = user.last_name
        $scope.formData.email = user.email
        $scope.formData.tel_num = user.tel_num
        $scope.formData.birth_date = user.birth_date
      , (error) ->
        console.log 'error'
        console.log error.status
        $scope.formData.error = 'There is no such user'
    )

  $scope.loadTemporaryUser()
  $scope.loadUser()

  # functions

  $scope.editUser = (userId) ->
    if $scope.formData.email && $scope.formData.first_name && $scope.formData.last_name
      user = $scope.formData
      userData.update({id: userId}, user
        , (success) =>
          $scope.editUserForm.$setPristine()
          $scope.addAlert('success')
          window.currentUser.first_name = success.first_name
        , (error) ->
          console.log 'error'
          $scope.formData.user_error = error.data.error
      )

  $scope.alerts = []

  $scope.addAlert = (type) ->
    $scope.closeAlert()
    $scope.alerts.push {type: type}

  $scope.closeAlert = (index) ->
    $scope.alerts.splice index, 1

angular.module("shop").controller "UserEditCtrl", UserEditCtrl
