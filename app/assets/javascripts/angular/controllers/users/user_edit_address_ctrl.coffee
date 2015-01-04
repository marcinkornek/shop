UserEditAddressCtrl = ($scope, $stateParams, $state, userData, addressData, $http) ->

  # temporary data

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
    $scope.closeAlert()

  # loading data

  $scope.loadAddress = (AddressId) ->
    $scope.checked = $scope.formData.addresses[0].id
    # console.log 'loadAddress'
    $scope.closeAlert()
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

  # functions

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
          $scope.addAlert('success', 'USER_EDIT_ADDRESS_ALERT_SUCCESS_ADD')
          $scope.formData.addresses.push(success)
          $scope.changeAddressesNumber('+')
          $scope.loadAddress(success.id)
          $scope.checked = success.id
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
          $scope.replaceAddress(success)
          $scope.loadAddress(success.id)
          $scope.addAlert('success', 'USER_EDIT_ADDRESS_ALERT_SUCCESS_EDIT')
          $scope.checked = success.id
        , (error) ->
          console.log 'error'
          $scope.formData.user_error = error.data.error
      )

  $scope.replaceAddress = (address) ->
    # console.log 'id', address
    $scope.formData.addresses = _.filter($scope.formData.addresses, (item) ->
      (item.id isnt address.id)
    )
    $scope.formData.addresses.push(address)
    $scope.formData.addresses = _.sortBy($scope.formData.addresses, 'id')

  $scope.destroyAddress = (addressId) ->
    addressData.delete(id: addressId)
    $scope.formData.addresses = _.filter($scope.formData.addresses, (item) ->
      (item.id isnt addressId)
    )
    $scope.changeAddressesNumber('-')
    $scope.loadFirstOrNew()
    $scope.addAlert('success', 'USER_EDIT_ADDRESS_ALERT_SUCCESS_DESTROY')

  $scope.changeAddressesNumber = (sign) ->
    switch sign
      when '+'
        # console.log 'before', $scope.formData.addresses_number
        $scope.formData.addresses_number = $scope.formData.addresses_number + 1
        # console.log 'after', $scope.formData.addresses_number
      when '-'
        # console.log 'before', $scope.formData.addresses_number
        $scope.formData.addresses_number = $scope.formData.addresses_number - 1
        # console.log 'after', $scope.formData.addresses_number

  $scope.loadFirstOrNew = ->
    switch $scope.formData.addresses_number
      when 0
        $scope.checked = 0
        $scope.loadNewAddress()
      else
        $scope.checked = $scope.formData.addresses[0].id
        $scope.loadAddress($scope.formData.addresses[0].id)

  # alerts

  $scope.alerts ||= []

  $scope.addAlert = (type, message) ->
    $scope.closeAlert()
    $scope.alerts.push { type: type, message: message }

  $scope.closeAlert = (index) ->
    $scope.alerts.splice index, 1

  # location typeahead

  $scope.getLocation = (val) ->
    $http.get("https://maps.googleapis.com/maps/api/geocode/json",
      params:
        address: val
        sensor: false
    ).then (response) ->
      response.data.results.map (item) ->
        item.formatted_address

angular.module("shop").controller "UserEditAddressCtrl", UserEditAddressCtrl
UserEditAddressCtrl.$inject = ["$scope", "$stateParams", "$state", "userData", "addressData", "$http"]
