module MainCategoryRepresenter
  include Roar::Representer::JSON

  property :name, as: :main_cat
  property :image, as: :main_cat_img
  collection :category_types, extend: CategoryTypeRepresenter

end
