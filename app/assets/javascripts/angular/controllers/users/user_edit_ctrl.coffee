UserEditCtrl = ($scope, $stateParams, $state, userData, addressData, $http) ->

  # temporary data

  $scope.loadTemporaryUser = ->
    $scope.formData =
      first_name: 'Loading..'
      last_name: 'Loading..'
      email: 'Loading..'
      tel_num: 'Loading..'
      birth_date: 'Loading..'

  $scope.loadTemporaryAddress = ->
    $scope.formData.address =
      first_name: 'Loading..'
      last_name: 'Loading..'
      tel_num: 'Loading..'
      street: 'Loading..'
      house_num: 'Loading..'
      town: 'Loading..'
      postcode: 'Loading..'

  # loading data

  $scope.firstLoadUser = ->
    $scope.checked = 0
    userData.get({id: 1}
    , (user) ->
      $scope.formData.id = user.user.id
      $scope.formData.first_name = user.user.first_name
      $scope.formData.last_name = user.user.last_name
      $scope.formData.email = user.user.email
      $scope.formData.tel_num = user.user.tel_num
      $scope.formData.birth_date = user.user.birth_date
      $scope.formData.addresses_number = user.addresses_number
      $scope.formData.addresses = user.addresses
      $scope.formData.provider = user.user.provider
      if user.addresses_number > 0
        $scope.loadTemporaryAddress()
        $scope.firstLoadAddress(user.addresses[0].id)
    , (error) ->
      console.log 'error'
      console.log error.status
      $scope.formData.error = 'There is no such user'
    )

  $scope.firstLoadAddress = (AddressId) ->
    $scope.checked = $scope.formData.addresses[0].id
    # console.log 'checked', $scope.checked
    # console.log 'firstLoadAddress'
    addressData.get({id: AddressId}
    , (address) ->
      # console.log address
      $scope.formData.address.id = address.id
      $scope.formData.address.first_name = address.first_name
      $scope.formData.address.last_name = address.last_name
      $scope.formData.address.tel_num = address.tel_num
      $scope.formData.address.street = address.street
      $scope.formData.address.house_num = address.house_num
      $scope.formData.address.town = address.town
      $scope.formData.address.postcode = address.postcode
    , (error) ->
      console.log 'error'
      console.log error.status
      $scope.formData.error = 'There is no such address'
    )

  $scope.loadTemporaryUser()
  $scope.firstLoadUser()

  # alerts

  $scope.alerts ||= []

  $scope.addAlert = (type, message) ->
    $scope.closeAlert()
    $scope.alerts.push { type: type, message: message }

  $scope.closeAlert = (index) ->
    $scope.alerts.splice index, 1

angular.module("shop").controller "UserEditCtrl", UserEditCtrl
UserEditCtrl.$inject = ["$scope", "$stateParams", "$state", "userData", "addressData", "$http"]
