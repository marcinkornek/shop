module ProductColorOrderRepresenter
  include Roar::Representer::JSON

  property :color
  property :images, as: :product_images
  property :product, extend: ProductOrderRepresenter

end
