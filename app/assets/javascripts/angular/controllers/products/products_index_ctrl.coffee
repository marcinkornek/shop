ProductsIndexCtrl = ($scope, $stateParams, $state, productData, PaginationIndex) ->

  # loading data

  $scope.loadProducts = ->
    $scope.data = {}
    $scope.data.category = category = $stateParams.category || null
    $scope.data.main_category = main_category = $stateParams.main_category
    $scope.data.category_type = category_type = $stateParams.category_type
    $scope.pagination = new PaginationIndex()

  $scope.loadProducts()

  # functions

  $scope.hoverIn = ->
    @hoverEdit = true

  $scope.hoverOut = ->
    @hoverEdit = false

  $scope.toggleDropdownSort = ->
    $scope.dropdownSort=!$scope.dropdownSort
    $scope.dropdownFilter = false

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

  $scope.cancelForm = ->
    $scope.formData = {}
    $scope.arraycolor = []
    $scope.arraysize = []
    $scope.toggleDropdownFilter()

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

angular.module("shop").controller "ProductsIndexCtrl", ProductsIndexCtrl
ProductsIndexCtrl.$inject = ["$scope", "$stateParams", "$state", "productData", "PaginationIndex"]
