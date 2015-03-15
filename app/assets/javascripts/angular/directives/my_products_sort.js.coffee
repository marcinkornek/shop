angular.module("shop").directive('myProductsIndexSort', ->
  {
    restrict: 'E'
    templateUrl: 'products/products_index_sort.html'
    controller: 'ProductsIndexSortCtrl'
  }
)
