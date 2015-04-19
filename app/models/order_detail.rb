class OrderDetail < ActiveRecord::Base
  belongs_to :order
  belongs_to :product_size

  validates :price,        presence: true,
                           numericality: {greater_than: 0}
  validates :amount,       presence: true,
                           numericality: {greater_than: 0}
  validates :product_size, presence: true
  validates :order,        presence: true
end
