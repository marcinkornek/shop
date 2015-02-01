class Api::ProductSizesController < ApplicationController

  def index
    array = params[:ids].split(",").map(&:to_i)
    b = Hash.new(0)
    array.each { |v| b[v] += 1 }
    array_new = b.map do |k, v|
      ProductSize.find(k).extend(ProductSizeOrderRepresenter).to_hash.merge(amount: v)
    end
    render json: array_new

  end

end
