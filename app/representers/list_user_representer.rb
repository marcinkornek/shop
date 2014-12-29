module ListUserRepresenter
  include Roar::Representer::JSON

  property :id
  property :first_name
  property :last_name
  property :created_at
  property :role

end
