module CategoryTypeRepresenter
  include Roar::JSON

  property :name, as: :category_type
  collection :categories, extend: CategoryRepresenter
end
