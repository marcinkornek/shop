describe 'UserEditCtrl', ->
  $controller = null
  $scope = null
  $state = null
  $httpBackend = null

  beforeEach ->
    module('shop')
    inject(($injector) ->
      $httpBackend = $injector.get('$httpBackend')
      $httpBackend.when('GET', '/api/users/1').respond(200, Helper.user)
    )
    inject((_$controller_, _$rootScope_, _$state_) ->
      # The injector unwraps the underscores (_) from around the parameter names when matching
      $controller = _$controller_
      $scope = _$rootScope_.$new()
      $state = _$state_
      spyOn( $state, 'go' )
      spyOn( $state, 'transitionTo' )
    )
    $controller('UserEditCtrl', { $scope: $scope, $state: $state })
    $scope.formData = {}
    $scope.data = {}

  describe '$scope.firstLoadUser', ->
    describe 'when user has address', ->
      beforeEach ->
        spyOn($scope, 'loadTemporaryAddress')
        spyOn($scope, 'firstLoadAddress')
        $scope.firstLoadUser()
        $httpBackend.flush()

      it 'loads data and sets to $scope.formData.attributeName', ->
        expect($scope.formData.id).toEqual(Helper.user.user.id)
        expect($scope.formData.first_name).toEqual(Helper.user.user.first_name)
        expect($scope.formData.last_name).toEqual(Helper.user.user.last_name)
        expect($scope.formData.email).toEqual(Helper.user.user.email)
        expect($scope.formData.tel_num).toEqual(Helper.user.user.tel_num)
        expect($scope.birth_date).toEqual(Helper.user.user.birth_date)
        expect($scope.formData.provider).toEqual(Helper.user.user.provider)
        expect($scope.formData.addresses_number).toEqual(Helper.user.addresses_number)
        expect($scope.formData.addresses).toEqual(Helper.user.addresses)

      it 'calls $scope.loadTemporaryAddress', ->
        expect($scope.loadTemporaryAddress).toHaveBeenCalled()

      it 'calls $scope.firstLoadAddress with first address', ->
        expect($scope.firstLoadAddress).toHaveBeenCalledWith(Helper.user.addresses[0])

  describe '$scope.firstLoadAddress(address)', ->
    beforeEach ->
      $scope.formData.address = {}
      $scope.firstLoadAddress(Helper.user.addresses[0])

    it 'sets address to $scope.formData.address.attributeName', ->
      expect($scope.checked).toEqual(Helper.user.addresses[0].id)
      expect($scope.formData.address.id).toEqual(Helper.user.addresses[0].id)
      expect($scope.formData.address.first_name).toEqual(Helper.user.addresses[0].first_name)
      expect($scope.formData.address.last_name).toEqual(Helper.user.addresses[0].last_name)
      expect($scope.formData.address.tel_num).toEqual(Helper.user.addresses[0].tel_num)
      expect($scope.formData.address.street).toEqual(Helper.user.addresses[0].street)
      expect($scope.formData.address.house_num).toEqual(Helper.user.addresses[0].house_num)
      expect($scope.formData.address.town).toEqual(Helper.user.addresses[0].town)
      expect($scope.formData.address.postcode).toEqual(Helper.user.addresses[0].postcode)

  Helper =
    user:
      user:
        id: 1
        first_name: 'first'
        last_name: 'last'
        tel_num: '111222333'
        birth_date: null
        email: 'first@last.com'
        created_at: '2015-06-19T08:04:46.953Z'
        role: 'user'
        provider: 'facebook'
      addresses_number: 1
      addresses: [
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
      ]
