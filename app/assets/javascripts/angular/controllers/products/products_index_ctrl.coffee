ProductsIndexCtrl = ($scope, $stateParams, $state, productData) ->

  # loading data

  $scope.loadProduct = ->
    category = $stateParams.category
    main_category = $stateParams.main_category
    category_type = $stateParams.category_type
    $scope.data = {}
    console.log 'loadProduct'
    productData.query({category: category, category_type: category_type, main_category: main_category}
      , (product) ->
        console.log 'product'
        console.log product
        $scope.data.products = product
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

angular.module("shop").controller "ProductsIndexCtrl", ProductsIndexCtrl
ProductsIndexCtrl.$inject = ["$scope", "$stateParams", "$state", "productData"]
