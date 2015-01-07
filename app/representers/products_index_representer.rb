require 'representable/json/collection'

module ProductsIndexRepresenter
  include Representable::JSON::Collection

  items extend: ProductIndexRepresenter

end
