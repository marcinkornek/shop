class Api::ProductColorsController < ApplicationController

  def index
    per_page = 4
    page = (params[:item].to_f/per_page).to_i + 1
    @products =if !params[:category].blank?
       Product.joins(category: [{category_type: :main_category}]).where(main_categories: {name: params[:main_category]}).where(  category_types: {name: params[:category_type]}).where(categories: {name: params[:category]})
    else
      Product.joins(category: [{category_type: :main_category}]).where(main_categories: {name: params[:main_category]}).where(  category_types: {name: params[:category_type]})
    end

    paginate_prod_or_nil(params[:item], page, per_page)

    render json: { products: @products }
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
    per_page = 4
    page = (params[:item].to_f/per_page).to_i + 1
    @products = Product.search(params[:search_query])

    paginate_prod_or_nil(params[:item], page, per_page)

    render json: { products: @products }
  end

  private

  def paginate_prod_or_nil(item, page, per_page)
    @products =if item.to_i != @products.count
      @products.paginate(page: page, per_page: per_page).extend(ProductsIndexRepresenter).to_hash
    else
      nil
    end
  end

end
