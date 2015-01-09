# ###
# https://github.com/angular-ui/bootstrap/issues/1350
# ###

angular.module("shop").directive "disableAnimation", ($animate) ->
  restrict: "A"
  link: ($scope, $element, $attrs) ->
    $attrs.$observe "disableAnimation", (value) ->
      $animate.enabled not value, $element
