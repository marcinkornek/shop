module UserRepresenter
  include Roar::JSON

  property :id
  property :first_name
  property :last_name
  property :tel_num
  property :birth_date
  property :email
  property :created_at
  property :role
end
