describe 'UserNewCtrl', ->
  $controller = null
  $scope = null
  $state = null
  $httpBackend = null

  beforeEach ->
    module('shop')
    inject(($injector) ->
      $httpBackend = $injector.get('$httpBackend')
      $httpBackend.when('POST', '/api/users').respond(200, Helper.user)
    )
    inject((_$controller_, _$rootScope_, _$state_) ->
      # The injector unwraps the underscores (_) from around the parameter names when matching
      $controller = _$controller_
      $scope = _$rootScope_.$new()
      $state = _$state_
      spyOn( $state, 'go' )
      spyOn( $state, 'transitionTo' )
    )
    $controller('UserNewCtrl', { $scope: $scope, $state: $state })
    $scope.formData = {}

  describe '$scope.createUser', ->
    describe 'when all required fields are fill in', ->
      beforeEach ->
        $scope.formData.first_name = 'first'
        $scope.formData.last_name = 'last'
        $scope.formData.email = 'email@email.com'
        $scope.formData.password = 'asdasdasd'
        $scope.formData.password_confirmation = 'asdasdasd'

      it 'creates user and redirects to login page', ->
        $scope.createUser()
        $httpBackend.flush()
        expect($state.go).toHaveBeenCalledWith('login')

    describe 'when required fields are not fill in', ->
      it 'does nothing', ->
        $scope.createUser()
        expect($state.go).not.toHaveBeenCalled()

  describe '$scope.isFormValid', ->
    describe 'when all required fields are fill in', ->
      beforeEach ->
        $scope.formData.first_name = 'first'
        $scope.formData.last_name = 'last'
        $scope.formData.email = 'email@email.com'
        $scope.formData.password = 'asdasdasd'
        $scope.formData.password_confirmation = 'asdasdasd'

      it 'returns true', ->
        expect($scope.isFormValid()).toEqual(true)

    describe 'when required fields are not fill in', ->
      it 'returns undefined', ->
        expect($scope.isFormValid()).toEqual(undefined)

  Helper =
    user:
      id: 1
      first_name: 'first'
      last_name: 'last'
      role: 'user'
      created_at: '2015-07-21T07:52:43.358Z'
