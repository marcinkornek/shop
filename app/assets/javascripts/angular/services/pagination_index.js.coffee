# ###
# https://github.com/sroze/ngInfiniteScroll/issues/63
# ###

angular.module('shop').factory "PaginationIndex", (productData) ->
  console.log 'PaginationIndex'
  PaginationIndex = ->
    @products = []
    @busy = false

  PaginationIndex::nextPage = (category, main_category, category_type) ->
    return if @busy
    @busy = true
    self = this

    items = productData.query({item: @products.length, category: category, main_category: main_category, category_type: category_type}
      , (data) ->
        product = data.products
        i = 0

        if product
          while i < product.length
            self.products.push product[i]
            i++
          self.busy = false
    )

  PaginationIndex

