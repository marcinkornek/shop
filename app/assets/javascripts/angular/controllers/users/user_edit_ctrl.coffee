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

  $scope.loadNewAddress = ->
    $scope.formData.address =
      first_name: ''
      last_name: ''
      tel_num: ''
      street: ''
      house_num: ''
      town: ''
      postcode: ''
    $scope.editOrCreateAddressForm.$setPristine()

  # loading data

  $scope.loadUser = ->
    userData.get({id: 1}
      , (user) ->
        # console.log user
        $scope.formData.id = user.user.id
        $scope.formData.first_name = user.user.first_name
        $scope.formData.last_name = user.user.last_name
        $scope.formData.email = user.user.email
        $scope.formData.tel_num = user.user.tel_num
        $scope.formData.birth_date = user.user.birth_date
        $scope.formData.addresses_ids = user.addresses_ids
        if user.addresses_number > 0
          $scope.loadTemporaryAddress()
          $scope.loadAddress(user.addresses_ids[0])
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
        $scope.formData.error = 'There is no such address'
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
          $scope.editUserForm.$setUntouched()
          $scope.addAlert('success')
          window.currentUser.first_name = success.first_name
        , (error) ->
          console.log 'error'
          $scope.formData.user_error = error.data.error
      )

  $scope.editOrCreateAddress = (addressId) ->
    switch addressId
      when undefined
        # console.log 'create'
        $scope.createAddress()
      else
        # console.log 'edit'
        $scope.editAddress(addressId)

  $scope.createAddress = ->
    if $scope.formData.address.first_name && $scope.formData.address.last_name && $scope.formData.address.tel_num && $scope.formData.address.street && $scope.formData.address.house_num && $scope.formData.address.town && $scope.formData.address.postcode
      address = $scope.formData.address
      addressData.save({}, address
        , (success) =>
          $scope.editOrCreateAddressForm.$setPristine()
          $scope.editOrCreateAddressForm.$setUntouched()
          $scope.addAlert('success')
          $scope.formData.addresses_ids.push(success.id)
        , (error) ->
          console.log 'error'
          $scope.formData.user_error = error.data.error
      )

  $scope.editAddress = (addressId) ->
    if $scope.formData.address.first_name && $scope.formData.address.last_name && $scope.formData.address.tel_num && $scope.formData.address.street && $scope.formData.address.house_num && $scope.formData.address.town && $scope.formData.address.postcode
      address = $scope.formData.address
      addressData.update({id: addressId}, address
        , (success) =>
          $scope.editOrCreateAddressForm.$setPristine()
          $scope.editOrCreateAddressForm.$setUntouched()
          $scope.addAlert('success')
        , (error) ->
          console.log 'error'
          $scope.formData.user_error = error.data.error
      )

  # alerts

  $scope.alerts ||= []

  $scope.addAlert = (type) ->
    $scope.closeAlert()
    $scope.alerts.push 'success'

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

angular.module("shop").controller "UserEditCtrl", UserEditCtrl
