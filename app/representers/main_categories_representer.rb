require 'representable/json/collection'

module MainCategoriesRepresenter
  include Representable::JSON::Collection

  items extend: MainCategoryRepresenter

end
