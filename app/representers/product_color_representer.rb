module ProductColorRepresenter
  include Roar::Representer::JSON

  property :id, as: :color_id
  property :color
  property :image, as: :color_image
  property :images, as: :product_images

end
