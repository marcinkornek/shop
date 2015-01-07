ProductsIndexCtrl = ($scope, $stateParams, $state, productData) ->

  # loading data

  $scope.loadProducts = ->
    $scope.data = {}
    $scope.data.category = category = $stateParams.category
    $scope.data.main_category = main_category = $stateParams.main_category
    $scope.data.category_type = category_type = $stateParams.category_type
    console.log 'loadProduct'
    productData.query({category: category, category_type: category_type, main_category: main_category}
      , (products) ->
        console.log 'products'
        console.log products.products
        $scope.data.products = products.products
      , (error) ->
        console.log 'error'
        console.log error.status
        $scope.formData.error = 'There is no such products'
    )

  $scope.loadProducts()

  # functions

  $scope.hoverIn = ->
    @hoverEdit = true

  $scope.hoverOut = ->
    @hoverEdit = false

  $scope.saveColor = (color_name) ->
    console.log color_name

angular.module("shop").controller "ProductsIndexCtrl", ProductsIndexCtrl
ProductsIndexCtrl.$inject = ["$scope", "$stateParams", "$state", "productData"]
