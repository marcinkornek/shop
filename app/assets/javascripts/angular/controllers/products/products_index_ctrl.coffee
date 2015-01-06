ProductsIndexCtrl = ($scope, $stateParams, $state, productData) ->

  # temporary data

  $scope.loadTemporaryProduct = ->
    $scope.formData =
      first_name: 'Loading..'
      last_name: 'Loading..'
      email: 'Loading..'
      tel_num: 'Loading..'
      birth_date: 'Loading..'

  # loading data

  $scope.loadProduct = ->
    category = $stateParams.category
    main_category = $stateParams.main_category
    $scope.data = {}
    console.log 'loadProduct'
    productData.query({category: category, main_category: main_category}
      , (product) ->
        console.log 'product'
        console.log product
        $scope.data.products = product
      , (error) ->
        console.log 'error'
        console.log error.status
        $scope.formData.error = 'There is no such product'
    )

  $scope.loadTemporaryProduct()
  $scope.loadProduct()

  # alerts

  $scope.alerts ||= []

  $scope.addAlert = (type, message) ->
    $scope.closeAlert()
    $scope.alerts.push { type: type, message: message }

  $scope.closeAlert = (index) ->
    $scope.alerts.splice index, 1

angular.module("shop").controller "ProductsIndexCtrl", ProductsIndexCtrl
ProductsIndexCtrl.$inject = ["$scope", "$stateParams", "$state", "productData"]
