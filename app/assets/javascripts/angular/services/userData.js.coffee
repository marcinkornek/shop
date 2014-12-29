angular.module('shop').factory "userData", ($resource) ->
  $resource("/api/users/:id", {id: "@id"},
    {
      update:         {method: "PUT"},
      query:          {method: "GET", isArray: false},
    }
  )
