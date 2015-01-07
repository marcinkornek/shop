class Api::ProductColorsController < ApplicationController

  def index
    if !params[:category].blank?
      @products = Product.joins(category: [{category_type: :main_category}]).where(main_categories: {name: params[:main_category]}).where(  category_types: {name: params[:category_type]}).where(categories: {name: params[:category]})
    else
      @products = Product.joins(category: [{category_type: :main_category}]).where(main_categories: {name: params[:main_category]}).where(  category_types: {name: params[:category_type]})
    end
    render json: { products: @products.extend(ProductsIndexRepresenter).to_hash }
  end

  def show
    pc = ProductColor.find_by(code: params[:id])
    p '-----------------'
    p pc.product.extend(ProductIndexRepresenter)
    p '-----------------'
    render json: { pr_det: pc.extend(ProductColorRepresenter).to_hash, pr: pc.product.extend(ProductIndexRepresenter).to_hash }
  end

  def products_search
    p '-----------------'
    p params
    p '-----------------'
    @products = Product.search(params[:search_query])
    render json: { products: @products.extend(ProductsIndexRepresenter).to_hash }
  end

end
