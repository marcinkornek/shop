# ###
# Checks if username or email is unique
# http://blog.brunoscopelliti.com/form-validation-the-angularjs-way
# http://stackoverflow.com/questions/25650623/i-need-to-make-angularjs-call-rails-controller-methods-how
# ##

angular.module("shop").directive "ngUnique",[ "$http", ($http) ->
  require: "ngModel"
  link: (scope, elem, attrs, ctrl) ->

    elem.one 'input', ->

      # object = username/email
      key = attrs.ngUnique

      # function uses 'underscore.js' function 'debounce' -> function inside debounce is invoked
      # after time in parameter (in miliseconds)

      debouncedRequest = _.debounce((value) ->
        params = {}
        params['key'] = key
        params['value'] = value
        $http.get("/api/check_if_unique_username",
          params: params
        )
        .success((data, status, headers, cfg) ->
          console.log 'success'
          ctrl.$setValidity "unique", true
        )
        .error ((data, status, headers, cfg) ->
          console.log 'error'
          ctrl.$setValidity "unique", false
        )
      , 500)
      scope.$watch attrs.ngModel, debouncedRequest
 ]
