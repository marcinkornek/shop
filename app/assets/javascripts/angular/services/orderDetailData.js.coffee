angular.module('shop').factory "orderDetailData", ($cookies, productSizeData) ->

  loadCartItemsFromServer: ->
    ids = JSON.parse($cookies.items_in_cart || '[]')
    productSizeData.query({ids: ids.toString()})

  loadCartItemsCountFromCookie: ->
    JSON.parse($cookies.items_in_cart || '[]').length

  loadCartItemsTotalPriceFromCookie: ->
    $cookies.total_price
