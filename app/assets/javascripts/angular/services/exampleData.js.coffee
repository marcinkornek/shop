angular.module('shop').factory "exampleData", ($resource) ->
  $resource("/api/examples/:id", {id: "@id"},
    {
      get:   {isArray: true},
      query: {isArray: false},
      update:        {method: "PUT"},
      order_summary: {method: "GET", isArray: false, url: '/api/order_summary'},
      order_close:   {method: "POST", url: '/api/order_close'},
      order_destroy: {method: "POST", url: '/api/order_destroy'},
      order_detail_destroy: {method: "POST", url: '/api/order_detail_destroy'},
    }
  )
