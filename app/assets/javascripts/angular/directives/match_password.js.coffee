# ###
# Check if password_confirmation match password
# http://blog.brunoscopelliti.com/angularjs-directive-to-check-that-passwords-match
# ###

angular.module("shop").directive "pwCheck", [ ->
  require: "ngModel"
  link: (scope, elem, attrs, ctrl) ->
    firstPassword = "#" + attrs.pwCheck
    elem.add(firstPassword).on "keyup", ->
      scope.$apply ->
        v = elem.val() is $(firstPassword).val()
        ctrl.$setValidity "pwmatch", v
 ]
