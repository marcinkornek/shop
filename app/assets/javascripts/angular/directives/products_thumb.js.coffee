angular.module("shop").directive('product', ->
  {
    restrict: 'E'
    templateUrl: 'products/product_thumb.html'
    controller: 'ProductsIndexCtrl'
    scope: {
      product: '='
    }
  }
)
