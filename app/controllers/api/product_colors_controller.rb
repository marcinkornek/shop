class Api::ProductColorsController < ApplicationController

  def index
    # p '-----------------'
    # p params[:item]
    # p '-----------------'
    @products = Product.joins(category: [{category_type: :main_category}]).where(main_categories: {name: params[:main_category]}).where(  category_types: {name: params[:category_type]})

    if !params[:category].blank?
      @products = @products.where(categories: {name: params[:category]})
    end

    if params[:item] == '0' || nil
      product_colors = ProductColor.all.where(product_id: @products.map(&:id))
      colors = product_colors.map(&:color).uniq
      product_sizes = ProductSize.all.where(product_color_id: product_colors.map(&:id))
      sizes = product_sizes.map(&:size).uniq
      count = @products.count
    end

    per_page = 4
    page = (params[:item].to_f/per_page).to_i + 1
    sort_prod(params[:sort])
    paginate_prod_or_nil(params[:item], page, per_page)

    render json: { products: @products_pag, count: count, colors: colors, sizes: sizes }
  end

  def show
    pc = ProductColor.find_by(code: params[:id])
    pr_cat = pc.product.category

    products = Product.joins(:category).where(categories: {id: pr_cat.id})
    codes = products.map {|pr| pr.product_colors[0].code }

    pc_code = pc.product.product_colors[0].code

    index = codes.index(pc_code)
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

    render json: { products: @products_pag, count: @products.count }
  end

  private

  def paginate_prod_or_nil(item, page, per_page)
    if item == '0' || nil
      @products_pag = @products.paginate(page: page, per_page: per_page*4).extend(ProductsIndexRepresenter).to_hash
    elsif item.to_i != @products.count
      @products_pag = @products.paginate(page: page, per_page: per_page).extend(ProductsIndexRepresenter).to_hash
    end
  end

  def sort_prod(sort)
    case sort
    when 'high'
      @products = @products.order(price: :desc)
    when 'low'
      @products = @products.order(price: :asc)
    when 'new'
      @products = @products.order(created_at: :desc)
    end
  end

end
