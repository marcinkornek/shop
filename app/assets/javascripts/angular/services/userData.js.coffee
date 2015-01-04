angular.module('shop').factory "userData", ($resource) ->
  $resource("/api/users/:id", {id: "@id"},
    {
      update:           {method: "PUT"},
      query:            {method: "GET", isArray: false},
      change_password:  {method: "PUT", url: '/api/change_password'},
      reset_password:   {method: "PUT", url: '/api/reset_password'},
      set_new_password: {method: "PUT", url: '/api/new_password'},
    }
  )
