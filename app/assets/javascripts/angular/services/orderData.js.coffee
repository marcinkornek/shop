angular.module('shop').factory "orderData", ($resource) ->
  $resource("/api/orders/:id", {id: "@id"},
    {
      update:         {method: "PUT"},
      query:          {method: "GET", isArray: false},
    }
  )
