module ProductIndexRepresenter
  include Roar::JSON

  property :id
  property :name
  property :created_at, as: :date
  property :composition
  property :price
  property :category, extend: CategoryIndexRepresenter
  collection :product_colors, extend: ProductColorRepresenter

end
