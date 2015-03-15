angular.module("shop").directive("myModalDeleteConfirmation", ->
  {
    restrict: 'E'
    transclude: true
    templateUrl: 'modals/modal_delete_confirmation.html'
    controller: 'ModalDeleteConfirmationCtrl'
    scope: {
      deleteConfirmation: '='
      confirm: '&onConfirm'
    }
  }
)
