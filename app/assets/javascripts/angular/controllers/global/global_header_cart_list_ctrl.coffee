GlobalHeaderCartListCtrl = ($scope, orderDetailData, $cookies, ngDialog) ->

  # loading data

  $scope.loadCartItemsFromCookie = ->
    $scope.formData.order.car_items_number = orderDetailData.loadCartItemsCountFromCookie()
    $scope.formData.order.total_price = orderDetailData.loadCartItemsTotalPriceFromCookie()
    $scope.formData.order.products = orderDetailData.loadCartItemsFromServer()

  $scope.loadCartItemsFromCookie()

  # functions

  $scope.modalDeleteConfirmation = (id) ->
    dialog = ngDialog.open
      template: 'modals/modal_delete_confirmation.html'

    dialog.closePromise.then((data) ->
      $scope.destroyItemFromCart(id) if data.value == 1
    )

  $scope.destroyItemFromCart = (id) ->
    deletedItem = _.where($scope.formData.order.products, {size_id: id})
    $scope.saveTotalPriceToCookies(deletedItem)
    $scope.formData.order.products = _.filter($scope.formData.order.products, (item) ->
      (item.size_id isnt id)
    )
    $scope.saveItemsToCookie($scope.formData.order.products)
    # save new values to cookie, refresh counter, total_price

  $scope.saveTotalPriceToCookies = (deletedItem) ->
    deletedItemPrice = deletedItem[0].product_color.product.price
    total_price = parseFloat($scope.formData.order.total_price) - parseFloat(deletedItemPrice)
    $cookies.total_price = total_price
    $scope.formData.order.total_price = orderDetailData.loadCartItemsTotalPriceFromCookie()

  $scope.saveItemsToCookie = (items_in_cart) ->
    $cookies.items_in_cart = JSON.stringify(items_in_cart)
    $scope.formData.order.car_items_number = orderDetailData.loadCartItemsCountFromCookie()

angular.module("shop").controller "GlobalHeaderCartListCtrl", GlobalHeaderCartListCtrl
GlobalHeaderCartListCtrl.$inject = ["$scope", "orderDetailData", "$cookies", "ngDialog"]
