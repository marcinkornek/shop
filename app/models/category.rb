class Category < ActiveRecord::Base
  has_many :products, dependent: :destroy
  belongs_to :category_type

  validates :name,            presence: true
end
