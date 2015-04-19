class Product < ActiveRecord::Base
  has_many :product_colors, dependent: :destroy
  belongs_to :category

  validates :name,            presence: true
  validates :composition,     presence: true
  validates :price,           numericality: {greater_than: 0}
  validates :category,        presence: true

  def self.search(query)
    where("name ilike ?", "%#{query}%")
  end

  def self.filter(products, colors = nil, sizes = nil, min = nil, max = nil)
    products = join_colors_sizes.where(product_colors: {product: products})
    products = filter_colors(products, colors) if colors.present?
    products = filter_sizes(products, sizes) if sizes.present?
    products = filter_price(products, min, max) if min.present? || max.present?
    products.distinct.includes(
      product_colors: :product_sizes, category: [category_type: :main_category]
    )
  end

  def self.filter_prod_by_category(main_category, category_type, category = nil)
    category_type = join_category.where(
      main_categories: {name: main_category}, category_types: {name: category_type}
    )
    if category
      category_type.where(categories: {name: category})
    else
      category_type
    end
  end

  def self.products_colors_sizes(products)
    product_colors = ProductColor.where(product: products)
    colors = product_colors.map(&:color).uniq
    product_sizes = ProductSize.where(product_color: product_colors)
    sizes = product_sizes.map(&:size).uniq
    {
      colors: colors,
      sizes: sizes
    }
  end

  def self.join_category
    joins(category: [{category_type: :main_category}])
  end

  def self.join_colors_sizes
    joins(product_colors: :product_sizes)
  end

  def self.filter_colors(products, colors)
    products.where(product_colors: {color: colors})
  end

  def self.filter_sizes(products, sizes)
    products.where(product_sizes: {size: sizes})
  end

  def self.filter_price(products, min, max)
    products = products.where("price > ?", min) if min.present?
    products = products.where("price < ?", max) if max.present?
    products
  end
end
