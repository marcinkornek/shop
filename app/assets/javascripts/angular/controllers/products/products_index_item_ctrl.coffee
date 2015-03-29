ProductsIndexItemCtrl = ($scope, ngDialog) ->

  $scope.hoverIn = ->
    @hoverEdit = true

  $scope.hoverOut = ->
    @hoverEdit = false

  $scope.data = {}

  $scope.saveCode = (code) ->
    $scope.data.current_code = code

  $scope.modalAddToCart = (colorCode) ->
    $scope.data.current_code ||= $scope.product.product_colors[0].code
    dialog = ngDialog.open
      template: 'modals/modal_add_to_cart.html',
      controller: 'ModalAddToCartCtrl',
      className: 'ngdialog-theme-default ngdialog-theme-width800 ngdialog-theme-height410',
      scope: $scope

angular.module("shop").controller "ProductsIndexItemCtrl", ProductsIndexItemCtrl
ProductsIndexItemCtrl.$inject = ["$scope", "ngDialog"]
