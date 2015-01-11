class Product < ActiveRecord::Base
  has_many :product_colors, dependent: :destroy
  belongs_to :category

  validates :name,            presence: true
  validates :composition,     presence: true
  validates :price,           numericality: { greater_than: 0 }
  validates :category,        presence: true

  def self.search(query)
    where("name ilike ?", "%#{query}%")
  end

  def self.join_category
    self.joins(category: [{category_type: :main_category}])
  end

  def self.filter_prod_by_category(main_category, category_type, category = nil)
    category_type = self.join_category.where(main_categories: {name: main_category}, category_types: {name: category_type})
    if category
      category_type.where(categories: {name: category})
    else
      category_type
    end
  end

  def self.products_count_colors_sizes(products)
    product_colors = ProductColor.where(product: products)
    colors = product_colors.map(&:color).uniq
    product_sizes = ProductSize.where(product_color: product_colors)
    sizes = product_sizes.map(&:size).uniq
    count = products.count
    products_details = {
      colors: colors,
      sizes: sizes,
      count: count,
    }
  end

end
