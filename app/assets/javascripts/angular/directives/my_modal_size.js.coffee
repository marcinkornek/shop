angular.module("shop").directive('myModalSize', ->
  {
    restrict: 'E'
    templateUrl: 'modals/modal_size.html'
    controller: 'ModalSizeCtrl'
    scope: {
      sizes: '='
      modalSize: '='
      sizeId: '='
    }
  }
)
