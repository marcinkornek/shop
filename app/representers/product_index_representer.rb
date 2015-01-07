module ProductIndexRepresenter
  include Roar::Representer::JSON

  property :id
  property :name
  property :composition
  property :price
  property :category, extend: CategoryIndexRepresenter
  collection :product_colors, extend: ProductColorRepresenter

end
