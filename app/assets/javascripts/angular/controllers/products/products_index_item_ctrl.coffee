ProductsIndexItemCtrl = ($scope, $stateParams, $state, productColorData, PaginationIndex) ->

  $scope.hoverIn = ->
    @hoverEdit = true

  $scope.hoverOut = ->
    @hoverEdit = false

angular.module("shop").controller "ProductsIndexItemCtrl", ProductsIndexItemCtrl
ProductsIndexItemCtrl.$inject = ["$scope", "$stateParams", "$state", "productColorData", "PaginationIndex"]
