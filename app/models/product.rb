class Product < ActiveRecord::Base
  has_many :product_colors, dependent: :destroy
  belongs_to :category

  validates :name,            presence: true
  validates :composition,     presence: true
  validates :price,           numericality: { greater_than: 0 }
  validates :category,        presence: true

end
