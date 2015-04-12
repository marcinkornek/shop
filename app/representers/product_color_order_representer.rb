module ProductColorOrderRepresenter
  include Roar::JSON

  property :color
  property :images, as: :product_images
  property :product, extend: ProductOrderRepresenter

end
