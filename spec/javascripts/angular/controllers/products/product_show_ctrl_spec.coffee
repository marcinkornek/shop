describe 'ProductShowCtrl', ->
  $controller = null
  $scope = null
  $httpBackend = null
  $cookies = null
  orderDetailData = null

  beforeEach ->
    module('shop')
    inject(($injector) ->
      $httpBackend = $injector.get('$httpBackend')
      $httpBackend.when('GET', '/api/product_colors').respond(200, Helper.product_color)
    )
    inject((_$controller_, _$rootScope_, _$cookies_, _$state_, _orderDetailData_) ->
      # The injector unwraps the underscores (_) from around the parameter names when matching
      $controller = _$controller_
      $scope = _$rootScope_.$new()
      $state = _$state_
      $cookies = _$cookies_
      orderDetailData = _orderDetailData_
      spyOn( $state, 'go' )
      spyOn( $state, 'transitionTo' )
    )
    $controller('ProductShowCtrl', { $scope: $scope })
    $scope.formData = {}
    $scope.data = {}

  describe '$scope.loadProduct', ->
    beforeEach ->
      spyOn($scope ,'setSizeIfOne')
      $scope.loadProduct()
      $httpBackend.flush()

    it 'loads data from server and saves in $scope', ->
      expect(JSON.stringify($scope.data.pr_det)).toEqual(JSON.stringify(Helper.product_color['pr_det']))
      expect(JSON.stringify($scope.data.pr)).toEqual(JSON.stringify(Helper.product_color['pr']))

    it 'calls $scope.setSizeIfOne', ->
      expect($scope.setSizeIfOne).toHaveBeenCalled()

  describe '$scope.addToCart', ->
    describe 'if $scope.formData.size_id is set', ->
      beforeEach ->
        spyOn($scope ,'saveTotalPriceToCookies')
        spyOn($scope ,'saveItemsToCookie')
        spyOn($scope ,'resetSize')
        $scope.formData.order = {}
        $scope.formData.size_id = 1
        spyOn(orderDetailData, 'loadCartItemsFromServer').and.returnValue(Helper.product_sizes)
        $scope.addToCart()

      it 'calls $scope.saveTotalPriceToCookies', ->
        expect($scope.saveTotalPriceToCookies).toHaveBeenCalled()

      it 'calls $scope.saveItemsToCookie', ->
        expect($scope.saveItemsToCookie).toHaveBeenCalled()

      it 'calls $scope.resetSize', ->
        expect($scope.resetSize).toHaveBeenCalled()

    describe 'if $scope.formData.size_id is not set', ->
      beforeEach ->
        spyOn($scope ,'modalSetSize')
        $scope.addToCart()

      it 'opens modal with sizes', ->
        expect($scope.modalSetSize).toHaveBeenCalled()

  describe '$scope.resetSize', ->
    beforeEach ->
      $scope.formData.size_id = 1

    it 'resets $scope.formData.size_id', ->
      $scope.resetSize()
      expect($scope.formData.size_id).toBe(undefined)

  describe '$scope.saveTotalPriceToCookies', ->
    beforeEach ->
      $scope.data.pr = {}
      $scope.formData.order = {}
      $scope.data.pr.price = '10.06'

    describe 'when $cookies.total_price is empty', ->
      it 'saves price to cookies', ->
        $scope.saveTotalPriceToCookies()
        expect($cookies.total_price).toEqual(10.06)

    describe 'when $cookies.total_price is not empty', ->
      beforeEach ->
        $cookies.total_price = '9.94'

      it 'adds price to total price and saves to cookies', ->
        $scope.saveTotalPriceToCookies()
        expect($cookies.total_price).toEqual(20.00)

  describe '$scope.saveItemsToCookie', ->
    beforeEach ->
      $scope.formData = {}
      $scope.formData.order = {}
      $scope.formData.size_id = 5

    describe 'when $cookies.items_in_cart is empty', ->
      it 'saves items number to cookies', ->
        $scope.saveItemsToCookie()
        expect($cookies.items_in_cart).toEqual('[5]')

    describe 'when $cookies.items_in_cart is not empty', ->
      beforeEach ->
        $cookies.items_in_cart = '[3]'

      it 'adds items number and saves to cookies', ->
        $scope.saveItemsToCookie()
        expect($cookies.items_in_cart).toEqual('[3,5]')

  describe '$scope.setSizeIfOne', ->
    beforeEach ->
      $scope.data.pr_det = {}
      spyOn($scope ,'chooseSize')

    describe 'if there is only 1 size', ->
      beforeEach ->
        $scope.data.pr_det.product_sizes = [{id: 1}]

      it 'calls $scope.chooseSize with size id', ->
        $scope.setSizeIfOne()
        expect($scope.chooseSize).toHaveBeenCalledWith(1)

    describe 'if there is more than 1 size', ->
      beforeEach ->
        $scope.data.pr_det.product_sizes = [{id: 1}, {id: 2}]

      it "doesn't call $scope.chooseSize", ->
        $scope.setSizeIfOne()
        expect($scope.chooseSize).not.toHaveBeenCalled()

  describe '$scope.chooseSize', ->
    it 'sets $scope.formData.size_id', ->
      $scope.chooseSize(1)
      expect($scope.formData.size_id).toEqual(1)

  Helper =
    product_color:
      pr_next: "wom-clo-out-faf0ec-blue"
      pr_numb: 1
      pr_prev: null
      prs_numb: 2
      pr:
        category: []
        composition: "100% cotton"
        date: "2015-02-22T12:54:27.807Z"
        id: 1
        name: "outerwear_1"
        price: "57.0"
      pr_det:
        code: "wom-clo-out-f04141-blue"
        color: "blue"
        color_id: 1
        color_image: []
        product_images: []
        product_sizes: []

    product_sizes: [
      amount: 1
      size: "M"
      size_id: 3
      product_color:
        color: "blue"
    ]
