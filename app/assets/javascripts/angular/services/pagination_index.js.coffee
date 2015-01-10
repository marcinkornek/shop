# ###
# https://github.com/sroze/ngInfiniteScroll/issues/63
# ###

angular.module('shop').factory "PaginationIndex", (productData) ->
  console.log 'PaginationIndex'
  PaginationIndex = ->
    @products = []
    @count = {}
    @colors = {}
    @sizes = {}

    @busy = false

  PaginationIndex::nextPage = (category, main_category, category_type, filter, sort) ->
    console.log 'filter-', filter, ', sort-', sort, 'busy-', @busy
    return if @busy
    @busy = true
    self = this

    items = productData.query({item: @products.length, category: category, main_category: main_category, category_type: category_type, filter: filter, sort: sort}
      , (data) ->
        product = data.products

        if self.products.length == 0
          self.count = data.count
          self.colors = data.colors
          self.sizes = data.sizes
        # console.log product
        i = 0

        if product
          while i < product.length
            self.products.push product[i]
            i++
          self.busy = false
    )

  PaginationIndex

