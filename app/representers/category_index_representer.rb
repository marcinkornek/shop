module CategoryIndexRepresenter
  include Roar::JSON

  property :name
  property :category_type, extend: CategoryTypeIndexRepresenter

end
