ProductsIndexCtrl = ($scope, $stateParams, $state, productColorData, PaginationIndex) ->

  # loading data

  $scope.loadProducts = ->
    $scope.data = {}
    $scope.data.category = category = $stateParams.category || null
    $scope.data.main_category = main_category = $stateParams.main_category
    $scope.data.category_type = category_type = $stateParams.category_type
    $scope.pagination = new PaginationIndex()

  $scope.loadProducts()
  $scope.formData = {}

# coffeelint: disable=max_line_length
angular.module("shop").controller "ProductsIndexCtrl", ProductsIndexCtrl
ProductsIndexCtrl.$inject = ["$scope", "$stateParams", "$state", "productColorData", "PaginationIndex"]
# coffeelint: enable=max_line_length
