class CategoryType < ActiveRecord::Base
  has_many :categories, dependent: :destroy
  belongs_to :main_category

  validates :name,            presence: true

end
