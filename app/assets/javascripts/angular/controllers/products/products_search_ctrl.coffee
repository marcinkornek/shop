ProductsSearchCtrl = ($scope, $stateParams, $state, PaginationSearch) ->

  # loading data

  $scope.loadProductsSearch = ->
    $scope.data = {}
    $scope.data.search_query = search_query = $stateParams.searchQuery
    console.log 'loadProductsSearch'
    $scope.pagination = new PaginationSearch()

  $scope.loadProductsSearch()

  # functions

  $scope.hoverIn = ->
    @hoverEdit = true

  $scope.hoverOut = ->
    @hoverEdit = false

angular.module("shop").controller "ProductsSearchCtrl", ProductsSearchCtrl
ProductsSearchCtrl.$inject = ["$scope", "$stateParams", "$state", "PaginationSearch"]
