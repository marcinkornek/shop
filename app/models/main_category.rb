class MainCategory < ActiveRecord::Base
  has_many :category_types, dependent: :destroy

  validates :name,            presence: true

end
