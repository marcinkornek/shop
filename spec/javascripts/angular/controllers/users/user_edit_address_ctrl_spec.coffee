describe 'UserEditAddressCtrl', ->
  $controller = null
  $scope = null
  $state = null
  $httpBackend = null

  beforeEach ->
    module('shop')
    inject(($injector) ->
      $httpBackend = $injector.get('$httpBackend')
      $httpBackend.when('POST', '/api/addresses').respond(200, Helper.address)
      $httpBackend.when('PUT', '/api/addresses/1').respond(200, Helper.address)
      $httpBackend.when('PUT', '/api/addresses/1').respond(200, Helper.address)
    )
    inject((_$controller_, _$rootScope_, _$state_) ->
      # The injector unwraps the underscores (_) from around the parameter names when matching
      $controller = _$controller_
      $scope = _$rootScope_.$new()
      $state = _$state_
      spyOn( $state, 'go' )
      spyOn( $state, 'transitionTo' )
    )
    $controller('UserEditAddressCtrl', { $scope: $scope, $state: $state })
    $scope.data = {}
    $scope.formData = {}

  describe '$scope.loadAddress(addressId)', ->
    beforeEach ->
      $scope.formData.address = {}
      $scope.formData.addresses = Helper.userAddresses
      $scope.loadAddress(1)

    it 'loads address and sets to $scope', ->
      expect($scope.checked).toEqual(Helper.userAddresses[0].id)
      expect($scope.formData.address.id).toEqual(Helper.userAddresses[0].id)
      expect($scope.formData.address.first_name).toEqual(Helper.userAddresses[0].first_name)
      expect($scope.formData.address.last_name).toEqual(Helper.userAddresses[0].last_name)
      expect($scope.formData.address.tel_num).toEqual(Helper.userAddresses[0].tel_num)
      expect($scope.formData.address.street).toEqual(Helper.userAddresses[0].street)
      expect($scope.formData.address.house_num).toEqual(Helper.userAddresses[0].house_num)
      expect($scope.formData.address.town).toEqual(Helper.userAddresses[0].town)
      expect($scope.formData.address.postcode).toEqual(Helper.userAddresses[0].postcode)

  describe '$scope.findAddress(addressId)', ->
    beforeEach ->
      $scope.formData.addresses = Helper.userAddresses

    it 'finds and returns address', ->
      expect($scope.findAddress(2)).toEqual(Helper.userAddresses[1])

  describe '$scope.createAddress', ->
    describe 'when all required fields are fill in', ->
      beforeEach ->
        spyOn($scope, 'changeAddressesNumber')
        spyOn($scope, 'loadAddress')
        spyOn($scope, 'addAlert')
        $scope.editOrCreateAddressForm = {
          $setUntouched: ->
          $setPristine: ->
        }
        $scope.formData.address = {}
        $scope.formData.addresses = []
        $scope.formData.address.first_name = 'first'
        $scope.formData.address.last_name = 'last'
        $scope.formData.address.tel_num = '111222333'
        $scope.formData.address.street = 'street'
        $scope.formData.address.house_num = '1'
        $scope.formData.address.town = 'Opole, Poland'
        $scope.formData.address.postcode = '11-111'
        $scope.createAddress()
        $httpBackend.flush()

      it 'adds created address to $scope.formData.addresses', ->
        expect(JSON.stringify($scope.formData.addresses)).toEqual(JSON.stringify([Helper.address]))

      it 'calls $scope.changeAddressesNumber(sign)', ->
        expect($scope.changeAddressesNumber).toHaveBeenCalledWith('+')

      it 'loads created address', ->
        expect($scope.loadAddress).toHaveBeenCalledWith(3)

      it 'displays alert', ->
        expect($scope.addAlert).toHaveBeenCalled()

  describe '$scope.editAddress', ->
    describe 'when all required fields are fill in', ->
      beforeEach ->
        spyOn($scope, 'loadAddress')
        spyOn($scope, 'replaceAddress')
        spyOn($scope, 'addAlert')
        $scope.editOrCreateAddressForm = {
          $setUntouched: ->
          $setPristine: ->
        }
        $scope.formData.address = {}
        $scope.formData.addresses = []
        $scope.formData.address.first_name = 'first'
        $scope.formData.address.last_name = 'last'
        $scope.formData.address.tel_num = '111222333'
        $scope.formData.address.street = 'street'
        $scope.formData.address.house_num = '1'
        $scope.formData.address.town = 'Opole, Poland'
        $scope.formData.address.postcode = '11-111'
        $scope.editAddress(1)
        $httpBackend.flush()

      it 'calls $scope.replaceAddress(address)', ->
        expect($scope.replaceAddress).toHaveBeenCalled()

      it 'loads created address', ->
        expect($scope.loadAddress).toHaveBeenCalledWith(3)

      it 'displays alert', ->
        expect($scope.addAlert).toHaveBeenCalled()

  describe '$scope.isFormValid', ->
    describe 'when all required fields are fill in', ->
      beforeEach ->
        $scope.formData.address = {}
        $scope.formData.address.first_name = 'first'
        $scope.formData.address.last_name = 'last'
        $scope.formData.address.tel_num = '111222333'
        $scope.formData.address.street = 'street'
        $scope.formData.address.house_num = '1'
        $scope.formData.address.town = 'Opole, Poland'
        $scope.formData.address.postcode = '11-111'

      it 'returns true', ->
        expect($scope.isFormValid()).toEqual(true)

    describe 'when required fields are not fill in', ->
      it 'returns undefined', ->
        $scope.formData.address = {}
        expect($scope.isFormValid()).toEqual(undefined)

  describe '$scope.replaceAddress(address)', ->
    beforeEach ->
      $scope.formData.addresses = Helper.userAddresses
      $scope.replaceAddress(Helper.replaceAddress)

    it 'replaces address', ->
      expect($scope.formData.addresses[1]).toEqual(Helper.replaceAddress)

  describe '$scope.destroyAddress(addressId)', ->
    beforeEach ->
      spyOn($scope, 'changeAddressesNumber')
      spyOn($scope, 'loadFirstOrNew')
      spyOn($scope, 'addAlert')
      $scope.formData.addresses_number = 2
      $scope.formData.addresses = Helper.userAddresses
      $scope.destroyAddress(1)

    it 'deletes address from scope', ->
      expect($scope.formData.addresses).toEqual([Helper.userAddresses[1]])

    it 'calls $scope.changeAddressesNumber', ->
      expect($scope.changeAddressesNumber).toHaveBeenCalled()

    it 'calls $scope.loadFirstOrNew', ->
      expect($scope.loadFirstOrNew).toHaveBeenCalled()

    it 'calls $scope.addAlert', ->
      expect($scope.addAlert).toHaveBeenCalled()

  describe '$scope.changeAddressesNumber(sign)', ->
    beforeEach ->
      $scope.formData.addresses_number = 2

    describe 'when sign +', ->
      it 'increases $scope.formData.addresses_number', ->
        $scope.changeAddressesNumber('+')
        expect($scope.formData.addresses_number).toEqual(3)

    describe 'when sign -', ->
      it 'decreases $scope.formData.addresses_number', ->
        $scope.changeAddressesNumber('-')
        expect($scope.formData.addresses_number).toEqual(1)

  describe '$scope.loadFirstOrNew', ->
    describe 'when $scope.formData.addresses_number == 0', ->
      beforeEach ->
        $scope.formData.addresses_number = 0
        spyOn($scope, 'loadNewAddress')
        $scope.loadFirstOrNew()

      it 'sets checked to 0', ->
        expect($scope.checked).toEqual(0)

      it 'loads new address form', ->
        expect($scope.loadNewAddress).toHaveBeenCalled()

  Helper =
    currentUser:
      id: 1
      first_name: 'old_first'
      role: 'user'
    updatedUser:
      id: 1
      first_name: 'first'
      role: 'user'
    userAddresses: [
      {
        id: 1
        first_name: "first_address"
        last_name: "last_address"
        house_num: "1"
        street: "street"
        postcode: "11-111"
        tel_num: "111222333"
        town: "Opole, Polska"
        updated_at: "2015-07-21T09:34:00.709Z"
        created_at: "2015-07-21T09:34:00.709Z"
      }
      {
        id: 2
        first_name: "first_address2"
        last_name: "last_address2"
        house_num: "2"
        street: "street2"
        postcode: "22-222"
        tel_num: "222333444"
        town: "Kraków, Polska"
        updated_at: "2015-07-21T09:34:00.709Z"
        created_at: "2015-07-21T09:34:00.709Z"
      }
    ]
    replaceAddress:
      id: 2
      first_name: "first_address3"
      last_name: "last_address3"
      house_num: "3"
      street: "street3"
      postcode: "33-333"
      tel_num: "333444555"
      town: "Warszawa, Polska"
      updated_at: "2015-07-21T09:34:00.709Z"
      created_at: "2015-07-21T09:34:00.709Z"
    address:
      id: 3
      first_name: "first_address3"
      last_name: "last_address3"
      house_num: "3"
      street: "street3"
      postcode: "33-333"
      tel_num: "333444555"
      town: "Warszawa, Polska"
      updated_at: "2015-07-21T09:34:00.709Z"
      created_at: "2015-07-21T09:34:00.709Z"
