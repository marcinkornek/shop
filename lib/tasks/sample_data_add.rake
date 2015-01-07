namespace :db do
  desc "Fill database with sample data"
  task add: :environment do
    add_products
  end

  def add_products
    p '-------make woman products---------'
    cat = 'blouses'
    colors = %w[white green gray]
    sizes = %w[XS S M L XL]

    category = Category.joins(category_type: :main_category).where(main_categories: {name: 'woman'}).where(category_types: {name: 'clothes'}).where(name: cat).first

    product = Product.new(name: cat+'_3', price: rand(10..100), composition: "100% cotton", category: category)

    colors.each do |color|
      product_color = ProductColor.new(color: color, product: product)
      if Rails.env.production?
        product_color.remote_image_url = 'https://s3-eu-west-1.amazonaws.com/shop-app/seed/woman/'+color+'.jpg'
        product_color.images = [open('https://s3-eu-west-1.amazonaws.com/shop-app/seed/woman/clothes/'+cat+'/'+cat+'_'+color+'_3.1.jpg'), open('https://s3-eu-west-1.amazonaws.com/shop-app/seed/woman/clothes/'+cat+'/'+cat+'_'+color+'_3.2.jpg'), open('https://s3-eu-west-1.amazonaws.com/shop-app/seed/woman/clothes/'+cat+'/'+cat+'_'+color+'_3.3.jpg')]
      else
        product_color.image = File.open('/home/mars/ruby/shop_pic/woman/'+color+'.jpg')
        product_color.images = [File.open('/home/mars/ruby/shop_pic/woman/clothes/'+cat+'/'+cat+'_'+color+'_3.1.jpg'), File.open('/home/mars/ruby/shop_pic/woman/clothes/'+cat+'/'+cat+'_'+color+'_3.2.jpg'), File.open('/home/mars/ruby/shop_pic/woman/clothes/'+cat+'/'+cat+'_'+color+'_3.3.jpg')]
      end
      sizes.each do |size|
        product_size = ProductSize.create(size: size, quantity: 100, product_color: product_color)
      end
    end

  end
end

