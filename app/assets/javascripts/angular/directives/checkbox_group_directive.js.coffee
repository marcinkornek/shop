# ###
# http://jsfiddle.net/t7kr8/211/
# ###

angular.module('shop').directive "checkboxGroup", ->
  restrict: "A"
  link: (scope, elem, attrs) ->

    # console.log scope.item
    console.log attrs.checkboxGroup
    # Determine initial checked boxes
    arrayName = "array#{attrs.checkboxGroup}"
    elem[0].checked = true  if scope[arrayName].indexOf(scope.item) isnt -1

    # Update array on click
    elem.bind "click", ->
      index = scope[arrayName].indexOf(scope.item)

      # Add if checked
      if elem[0].checked
        scope[arrayName].push scope.item  if index is -1

      # Remove if unchecked
      else
        scope[arrayName].splice index, 1  if index isnt -1

      # Sort and update DOM display
      scope.$apply scope[arrayName].sort((a, b) ->
        a - b
      )
