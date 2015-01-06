class ProductColor < ActiveRecord::Base
  has_many :product_sizes, dependent: :destroy
  belongs_to :product

  mount_uploader :image, ImageUploader
  before_save { color.downcase! }

  validates :color,           presence: true
  validates :image,           presence: true
  validates :product,         presence: true

end
