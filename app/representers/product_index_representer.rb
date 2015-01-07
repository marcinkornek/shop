module ProductIndexRepresenter
  include Roar::Representer::JSON

  property :id
  property :name
  property :price
  collection :product_colors, extend: ProductColorRepresenter

end
