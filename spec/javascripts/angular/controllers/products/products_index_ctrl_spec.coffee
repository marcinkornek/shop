describe 'ProductsIndexCtrl', ->
  $controller = null
  $scope = null
  $stateParams = null

  beforeEach ->
    module('shop')
    inject((_$controller_, _$rootScope_, _$state_) ->
      # The injector unwraps the underscores (_) from around the parameter names when matching
      $controller = _$controller_
      $scope = _$rootScope_.$new()
      $state = _$state_
      $stateParams = { category: 'blouses', main_category: 'woman', category_type: 'clothes' }
      spyOn( $state, 'go' )
      spyOn( $state, 'transitionTo' )
    )
    $controller('ProductsIndexCtrl', { $scope: $scope, $stateParams: $stateParams })
    $scope.data = {}

  describe '$scope.loadProducts', ->
    beforeEach ->
      $scope.loadProducts()

    it 'loads data from stateParams and saves in $scope', ->
      expect($scope.data.category).toEqual('blouses')
      expect($scope.data.main_category).toEqual('woman')
      expect($scope.data.category_type).toEqual('clothes')
