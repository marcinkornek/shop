ProductsSearchCtrl = ($scope, $stateParams, $state, productData) ->

  # loading data

  $scope.loadProducts = ->
    $scope.data = {}
    $scope.data.search_query = search_query = $stateParams.searchQuery
    console.log 'loadProduct'
    productData.search({search_query: search_query}
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

angular.module("shop").controller "ProductsSearchCtrl", ProductsSearchCtrl
ProductsSearchCtrl.$inject = ["$scope", "$stateParams", "$state", "productData"]
