describe 'UserEditDataCtrl', ->
  $controller = null
  $scope = null
  $state = null
  $httpBackend = null

  beforeEach ->
    module('shop')
    inject(($injector) ->
      $httpBackend = $injector.get('$httpBackend')
      $httpBackend.when('PUT', '/api/users/1').respond(200, Helper.updatedUser)
    )
    inject((_$controller_, _$rootScope_, _$state_) ->
      # The injector unwraps the underscores (_) from around the parameter names when matching
      $controller = _$controller_
      $scope = _$rootScope_.$new()
      $state = _$state_
      spyOn( $state, 'go' )
      spyOn( $state, 'transitionTo' )
    )
    $controller('UserEditDataCtrl', { $scope: $scope, $state: $state })
    $scope.data = {}
    $scope.formData = {}

  describe '$scope.editUser(userId)', ->
    beforeEach ->
      window.currentUser = Helper.currentUser
      spyOn($scope, 'addAlert')
      $scope.editUserForm = {
        $setUntouched: ->
        $setPristine: ->
      }
      $scope.formData.email = 'old@email.com'
      $scope.formData.first_name = 'old_first'
      $scope.formData.last_name = 'old_last'
      $scope.editUser(1)
      $httpBackend.flush()

    it 'edits user and sets new window.currentUser.first_name', ->
      expect(window.currentUser.first_name).toEqual('first')

    it 'displays alert', ->
      expect($scope.addAlert).toHaveBeenCalled()

  Helper =
    currentUser:
      id: 1
      first_name: 'old_first'
      role: 'user'
    updatedUser:
      id: 1
      first_name: 'first'
      role: 'user'
