angular.module("shop").directive('myProductsIndexFilter', ->
  {
    restrict: 'E'
    templateUrl: 'products/products_index_filter.html'
    controller: 'ProductsIndexFilterCtrl'
  }
)
