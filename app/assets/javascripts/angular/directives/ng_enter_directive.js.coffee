# ###
# directive to submit form with enter keypress
# http://stackoverflow.com/a/17472118
# ###

angular.module("shop").directive "ngEnter", ->
  (scope, element, attrs) ->
    element.bind "keydown keypress", (event) ->
      if event.which is 13
        scope.$apply ->
          scope.$eval attrs.ngEnter

        event.preventDefault()

