angular.module('shop').factory "productSizeData", ($resource) ->
  $resource("/api/product_sizes/:id", {id: "@id"},
    query:   {method: "GET", isArray: true},
  )
