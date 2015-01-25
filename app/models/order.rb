class Order < ActiveRecord::Base
  belongs_to :user
  has_many :order_details

  validates :total_price,   presence: true,
                            numericality: { greater_than: 0 }
  validates :state,         presence: true
  validates :user,          presence: true
end
