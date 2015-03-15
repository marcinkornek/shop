angular.module("shop").directive('myProductsIndexItem', ->
  {
    restrict: 'E'
    templateUrl: 'products/products_index_item.html'
    controller: 'ProductsIndexItemCtrl'
    scope: {
      product: '='
    }
  }
)
