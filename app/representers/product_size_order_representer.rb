module ProductSizeOrderRepresenter
  include Roar::JSON

  property :id, as: :size_id
  property :size
  property :product_color, extend: ProductColorOrderRepresenter
end
