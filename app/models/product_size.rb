class ProductSize < ActiveRecord::Base
  belongs_to :product_color
  has_many :order_details

  validates :size,            presence: true
  validates :quantity,        presence: true
  validates :product_color,   presence: true
end
