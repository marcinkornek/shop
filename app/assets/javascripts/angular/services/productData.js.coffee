angular.module('shop').factory "productData", ($resource) ->
  $resource("/api/products/:id", {id: "@id"},
    {
      update:           {method: "PUT"},
      # query:            {method: "GET", isArray: false},
    }
  )
