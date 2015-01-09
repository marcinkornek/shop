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
    pr_cat = pc.product.category

    products = Product.joins(:category).where(categories: {id: pr_cat.id})
    codes = products.map {|pr| pr.product_colors[0].code}

    index = codes.index(pc.code)
    pr_prev = codes[index-1] if index > 0
    pr_next = codes[index+1] if index < codes.length - 1

    items = {
      pr_prev: pr_prev,
      pr_next: pr_next,
      pr_numb: index + 1,
      prs_numb: codes.length,
    }
    render json: { pr_det: pc.extend(ProductColorRepresenter).to_hash, pr: pc.product.extend(ProductIndexRepresenter).to_hash}.merge(items)
  end

  def products_search
    @products = Product.search(params[:search_query])
    render json: { products: @products.extend(ProductsIndexRepresenter).to_hash }
  end

end
