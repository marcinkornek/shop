angular.module('shop').factory "addressData", ($resource) ->
  $resource("/api/addresses/:id", {id: "@id"},
    {
      update:         {method: "PUT"},
      query:          {method: "GET", isArray: false},
    }
  )
