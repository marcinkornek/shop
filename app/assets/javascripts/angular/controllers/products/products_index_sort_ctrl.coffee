ProductsIndexSortCtrl = ($scope) ->

  # functions

  $scope.toggleDropdownSort = ->
    $scope.dropdownSort=!$scope.dropdownSort
    $scope.dropdownFilter = false

  $scope.formData = {}
  $scope.arraycolor = []
  $scope.arraysize = []

  $scope.sortProd = (type) ->
    $scope.sort = type
    $scope.sortProd.class = type
    $scope.toggleDropdownSort()
    $scope.clearProducts()

  $scope.cancelSort = ->
    $scope.sort = null
    $scope.clearProducts()
    $scope.sortProd.class = null

  $scope.clearProducts = ->
    $scope.pagination.products = []
    $scope.pagination.busy = false
    $scope.pagination.nextPage($scope.data.category, $scope.data.main_category, $scope.data.category_type, $scope.formData, $scope.sort)

angular.module("shop").controller "ProductsIndexSortCtrl", ProductsIndexSortCtrl
ProductsIndexSortCtrl.$inject = ["$scope"]
