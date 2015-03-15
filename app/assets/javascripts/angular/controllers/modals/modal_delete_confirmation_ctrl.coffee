ModalDeleteConfirmationCtrl = ($scope) ->

  $scope.closeModal = ->
    $scope.deleteConfirmation = 0

angular.module("shop").controller "ModalDeleteConfirmationCtrl", ModalDeleteConfirmationCtrl
ModalDeleteConfirmationCtrl.$inject = ["$scope"]
