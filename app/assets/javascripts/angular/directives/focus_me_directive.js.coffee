# ###
# usage - add ng-click="focusInput=true" to button and focus-me="focusInput" to input
# http://stackoverflow.com/a/14837021
# ###

angular.module('shop').directive "focusMe", ($timeout) ->
  scope:
    trigger: "=focusMe"

  link: (scope, element) ->
    scope.$watch "trigger", (value) ->
      if value is true
        console.log "trigger", value
        $timeout ->
          element[0].focus()
          scope.trigger = false
