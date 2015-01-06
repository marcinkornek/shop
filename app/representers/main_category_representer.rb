module MainCategoryRepresenter
  include Roar::Representer::JSON

  property :main_cat
  property :main_cat_img
  collection :category_types, extend: CategoryTypeRepresenter

  def main_cat
    name
  end

  def main_cat_img
    image
  end
end
