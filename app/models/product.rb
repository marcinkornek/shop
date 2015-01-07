class Product < ActiveRecord::Base
  has_many :product_colors, dependent: :destroy
  belongs_to :category

  before_save :add_code

  validates :name,            presence: true
  validates :code,            uniqueness: { case_sensitive: false }
  validates :composition,     presence: true
  validates :price,           numericality: { greater_than: 0 }
  validates :category,        presence: true

  private

  def add_code
    cat_type = category.category_type
    main_cat = cat_type.main_category
    code = main_cat.name.slice(0..2)+'-'+cat_type.name.slice(0..2)+'-'+category.name.gsub(/-/, '').slice(0..2)+'-'+SecureRandom.hex(3)
    self.code = code
  end

end
