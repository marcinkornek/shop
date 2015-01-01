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

  $scope.loadUser = ->
    userData.get({id: 1}
      , (user) ->
        # console.log user
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

  $scope.loadAddress = (AddressId) ->
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
        $scope.formData.error = 'There is no such user'
    )

  $scope.loadTemporaryUser()
  $scope.loadUser()

  $scope.loadTemporaryAddress()
  $scope.loadAddress(1)

  # functions

  $scope.editUser = (userId) ->
    if $scope.formData.email && $scope.formData.first_name && $scope.formData.last_name
      user = $scope.formData
      userData.update({id: userId}, user
        , (success) =>
          # $scope.editUserForm.$setPristine()
          # $scope.editUserForm.$setUntouched()
          $scope.addAlert('success')
          window.currentUser.first_name = success.first_name
        , (error) ->
          console.log 'error'
          $scope.formData.user_error = error.data.error
      )

  $scope.editAddress = (addressId) ->
    if $scope.formData.address.first_name && $scope.formData.address.last_name && $scope.formData.address.tel_num && $scope.formData.address.street && $scope.formData.address.house_num && $scope.formData.address.town && $scope.formData.address.postcode
      address = $scope.formData
      addressData.update({id: addressId}, address
        , (success) =>
          # $scope.editUserForm.$setPristine()
          # $scope.editUserForm.$setUntouched()
          $scope.addAlert('success')
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

  # location typeahead

  $scope.getLocation = (val) ->
    $http.get("http://maps.googleapis.com/maps/api/geocode/json",
      params:
        address: val
        sensor: false
    ).then (response) ->
      response.data.results.map (item) ->
        item.formatted_address

  $scope.createAddressUser = ->
    console.log $scope.formData.address

angular.module("shop").controller "UserEditCtrl", UserEditCtrl
