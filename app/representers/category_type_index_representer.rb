module CategoryTypeIndexRepresenter
  include Roar::Representer::JSON

  property :name
  property :main_category, extend: MainCategoryIndexRepresenter

end
