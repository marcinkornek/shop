ProductsIndexCtrl = ($scope, $stateParams, $state, PaginationIndex) ->

  # loading data

  $scope.loadProducts = ->
    $scope.data = {}
    $scope.data.category = category = $stateParams.category
    $scope.data.main_category = main_category = $stateParams.main_category
    $scope.data.category_type = category_type = $stateParams.category_type
    console.log 'loadProduct'
    $scope.pagination = new PaginationIndex()

  $scope.loadProducts()

  # functions

  $scope.hoverIn = ->
    @hoverEdit = true

  $scope.hoverOut = ->
    @hoverEdit = false

angular.module("shop").controller "ProductsIndexCtrl", ProductsIndexCtrl
ProductsIndexCtrl.$inject = ["$scope", "$stateParams", "$state", "PaginationIndex"]
