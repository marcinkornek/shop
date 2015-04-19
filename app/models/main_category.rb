class MainCategory < ActiveRecord::Base
  has_many :category_types, dependent: :destroy

  mount_uploader :image, ImageUploader

  validates :name,            presence: true
end
