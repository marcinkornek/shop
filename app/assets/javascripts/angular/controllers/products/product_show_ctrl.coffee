ProductShowCtrl = ($scope, $stateParams, $state, productColorData, $cookies, orderDetailData) ->

  # loading data

  $scope.formData = {}

  $scope.formData.order = orderDetailData

  $scope.loadProduct = ->
    $scope.data = {}
    $scope.data.category = category = $stateParams.category
    $scope.data.main_category = main_category = $stateParams.main_category
    $scope.data.category_type = category_type = $stateParams.category_type
    $scope.data.code = code = $stateParams.code
    productColorData.get({code: code}
      , (product) ->
        console.log product
        $scope.data.pr_det = product.pr_det
        $scope.data.pr = product.pr
        $scope.data.items = product
        $scope.setSizeIfOne()
      , (error) ->
        console.log 'error'
        console.log error.status
        $scope.formData.error = 'There is no such product'
    )

  $scope.loadProduct()

  # functions

  $scope.hoverIn = ->
    @hoverEdit = true

  $scope.hoverOut = ->
    @hoverEdit = false

  $scope.addToCart = ->
    if $scope.formData.size_id
      $saveTotalPriceToCookies()
      $saveItemsToCookie()

  $saveTotalPriceToCookies = ->
    total_price = $cookies.total_price || 0
    total_price = parseFloat(total_price) + parseFloat($scope.data.pr.price)
    $cookies.total_price = total_price
    $scope.formData.order.total_price = total_price

  $saveItemsToCookie = ->
    array = JSON.parse($cookies.cart || '[]')
    array.push $scope.formData.size_id
    $cookies.cart = JSON.stringify(array)
    $scope.formData.order.car_items_number = array.length

  $scope.chooseSize = (size_id) ->
    $scope.formData.size_id = size_id

  $scope.setSizeIfOne = ->
    pr_sizes = $scope.data.pr_det.product_sizes
    if pr_sizes.length == 1
      size_id = pr_sizes[0].id
      $scope.chooseSize(size_id)

  $scope.isCollapsed = $scope.isCollapsed2 = $scope.isCollapsed3 = true

angular.module("shop").controller "ProductShowCtrl", ProductShowCtrl
ProductShowCtrl.$inject = ["$scope", "$stateParams", "$state", "productColorData", "$cookies", "orderDetailData"]
