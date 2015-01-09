angular.module('shop').factory "PaginationSearch", (productData) ->
  console.log 'PaginationSearch'
  PaginationSearch = ->
    @products = []
    @busy = false

  PaginationSearch::nextPage = (search_query) ->
    return if @busy
    @busy = true
    self = this

    items = productData.search({item: @products.length, search_query: search_query}
      , (data) ->
        product = data.products
        i = 0

        if product
          while i < product.length
            self.products.push product[i]
            i++
          self.busy = false
    )

  PaginationSearch

