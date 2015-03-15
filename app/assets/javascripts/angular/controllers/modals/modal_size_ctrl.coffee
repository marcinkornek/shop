ModalSizeCtrl = ($scope) ->

  $scope.chooseSize = (size_id) ->
    $scope.sizeId = size_id
    $scope.closeModal() if $scope.modalSize

  $scope.closeModal = ->
    $scope.modalSize = 0

angular.module("shop").controller "ModalSizeCtrl", ModalSizeCtrl
ModalSizeCtrl.$inject = ["$scope"]
