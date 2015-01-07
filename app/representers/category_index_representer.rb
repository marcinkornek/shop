module CategoryIndexRepresenter
  include Roar::Representer::JSON

  property :name
  property :category_type, extend: CategoryTypeIndexRepresenter

end
