module ProductColorRepresenter
  include Roar::JSON

  property :id, as: :color_id
  property :color
  property :code
  property :image, as: :color_image
  property :images, as: :product_images
  collection :product_sizes, extend: ProductSizeRepresenter

end
