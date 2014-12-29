require 'representable/json/collection'

module ListUsersRepresenter
  include Representable::JSON::Collection

  items extend: ListUserRepresenter

end
