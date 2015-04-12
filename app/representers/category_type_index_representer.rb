module CategoryTypeIndexRepresenter
  include Roar::JSON

  property :name
  property :main_category, extend: MainCategoryIndexRepresenter

end
