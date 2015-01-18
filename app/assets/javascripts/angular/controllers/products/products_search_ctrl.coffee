ProductsSearchCtrl = ($scope, $stateParams, $state, PaginationSearch) ->

  # loading data

  $scope.loadProductsSearch = ->
    $scope.data = {}
    $scope.search_query = search_query = $stateParams.searchQuery
    $scope.pagination = new PaginationSearch()

  $scope.loadProductsSearch()

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
    $scope.pagination.nextPage($scope.data.category, $scope.data.main_category, $scope.data.category_type, $scope.formData, $scope.sort, $stateParams.searchQuery)

angular.module("shop").controller "ProductsSearchCtrl", ProductsSearchCtrl
ProductsSearchCtrl.$inject = ["$scope", "$stateParams", "$state", "PaginationSearch"]
