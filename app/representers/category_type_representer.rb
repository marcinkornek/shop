module CategoryTypeRepresenter
  include Roar::Representer::JSON

  property :name, as: :category_type
  collection :categories, extend: CategoryRepresenter

end
