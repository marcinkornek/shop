module CategoryTypeRepresenter
  include Roar::Representer::JSON

  property :category_type
  collection :categories, extend: CategoryRepresenter

  def category_type
    name
  end

end
