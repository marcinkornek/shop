ProductsIndexFilterCtrl = ($scope) ->

  # functions

  $scope.toggleDropdownFilter = ->
    $scope.dropdownFilter=!$scope.dropdownFilter
    $scope.dropdownSort = false

  $scope.formData = {}
  $scope.arraycolor = []
  $scope.arraysize = []

  $scope.filterProd = ->
    $scope.formData.colors = $scope.arraycolor
    $scope.formData.sizes = $scope.arraysize
    $scope.toggleDropdownFilter()
    $scope.clearProducts()

  $scope.clearProducts = ->
    $scope.pagination.products = []
    $scope.pagination.busy = false
    $scope.pagination.nextPage(
      $scope.data.category,
      $scope.data.main_category,
      $scope.data.category_type,
      $scope.formData,
      $scope.sort
    )

angular.module("shop").controller "ProductsIndexFilterCtrl", ProductsIndexFilterCtrl
ProductsIndexFilterCtrl.$inject = ["$scope"]
