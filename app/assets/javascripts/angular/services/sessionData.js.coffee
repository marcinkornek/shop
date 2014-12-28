angular.module('shop').factory "sessionData", ($resource) ->
  $resource("/api/session", {})
