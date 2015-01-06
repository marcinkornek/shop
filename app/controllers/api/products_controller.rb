class Api::ProductsController < ApplicationController

  def index
    if !params[:category].blank?
      @products = Product.joins(category: [{category_type: :main_category}]).where(main_categories: {name: params[:main_category]}).where(  category_types: {name: params[:category_type]}).where(categories: {name: params[:category]})
    else
      @products = Product.joins(category: [{category_type: :main_category}]).where(main_categories: {name: params[:main_category]}).where(  category_types: {name: params[:category_type]})
    end
    render json: @products
  end

end
