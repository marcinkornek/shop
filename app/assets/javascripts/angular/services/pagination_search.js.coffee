# ###
# https://github.com/sroze/ngInfiniteScroll/issues/63
# ###

angular.module('shop').factory "PaginationSearch", (productColorData) ->
  PaginationSearch = ->
    @products = []
    @busy = false

  PaginationSearch::nextPage = (category, main_category, category_type, filter, sort, search_query) ->
    # console.log 'filter-', filter, ', sort-', sort, 'busy-', @busy, 'search_query-', search_query
    return if @busy
    @busy = true
    self = this

    items = productColorData.search(
      {
        item: @products.length,
        search_query: search_query,
        filter: filter,
        sort: sort
      }
      , (data) ->
        product = data.products
        i = 0

        if self.products.length == 0
          self.count = data.products_details.count
          self.colors = data.products_details.colors
          self.sizes = data.products_details.sizes
        i = 0

        if product
          while i < product.length
            self.products.push product[i]
            i++
          self.busy = false
    )

  PaginationSearch

