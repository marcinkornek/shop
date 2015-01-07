ProductShowCtrl = ($scope, $stateParams, $state, productData) ->

  # loading data

  $scope.loadProduct = ->
    $scope.data = {}
    $scope.data.category = category = $stateParams.category
    $scope.data.main_category = main_category = $stateParams.main_category
    console.log category
    $scope.data.category_type = category_type = $stateParams.category_type
    $scope.data.code = code = $stateParams.code
    # console.log 'loadProduct'
    productData.get({code: code}
      , (product) ->
        # console.log 'product'
        # console.log product
        $scope.data.pr_det = product.pr_det
        $scope.data.pr = product.pr
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

  $scope.isCollapsed = $scope.isCollapsed2 = $scope.isCollapsed3 = true

angular.module("shop").controller "ProductShowCtrl", ProductShowCtrl
ProductShowCtrl.$inject = ["$scope", "$stateParams", "$state", "productData"]
