angular.module('shop').factory "productData", ($resource) ->
  $resource("/api/product_colors/:id", {id: "@id"},
    {
      update:           {method: "PUT"},
      query:            {method: "GET", isArray: false},
      get:              {method: "GET", isArray: false, url: '/api/product_colors/:code'},
      search:           {method: "GET", isArray: false, url: '/api/products_search'},
    }
  )
