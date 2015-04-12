angular.module("shop").directive('myHeaderCartDropdownList', ->
  {
    restrict: 'E'
    templateUrl: 'global/header_cart_list.html'
    controller: 'GlobalHeaderCartListCtrl'
  }
)
