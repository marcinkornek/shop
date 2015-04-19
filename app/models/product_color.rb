class ProductColor < ActiveRecord::Base
  has_many :product_sizes, dependent: :destroy
  belongs_to :product

  def to_param
    code
  end

  mount_uploader :image, ImageUploader
  mount_uploaders :images, ImageUploader

  before_save { color.downcase! }
  before_save :add_code

  validates :code,            uniqueness: {case_sensitive: false}
  validates :color,           presence: true
  validates :image,           presence: true
  validates :images,          presence: true
  validates :product,         presence: true

  private

  def add_code
    cat_type = product.category.category_type
    main_cat = cat_type.main_category
    code = main_cat.name.slice(0..2)+'-'+cat_type.name.slice(0..2)+'-'+product.category.name.gsub(/-/, '').slice(0..2)+'-'+SecureRandom.hex(3)+'-'+color
    self.code = code
  end

end
