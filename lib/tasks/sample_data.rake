namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    Rake::Task["db:reset"].invoke if Rails.env.development?
    make_products
  end

  def make_products
    woman_clothes_categories = %w[outerwear jackets sweaters sweatshirts blouses shirts t-shirts dresses skirts trousers jeans shorts lingerie]
    woman_accessories_categories = %w[bags shoes hats scarves belts gloves sunglasses jewellery]
    woman_color = 'blue'
    woman_sizes = %w[XS S M L XL]

    man_clothes_categories = %w[outerwear jackets sweaters sweatshirts shirts t-shirts polos trousers jeans shorts lingerie]
    man_accessories_categories = %w[bags shoes hats scarves ties belts gloves sunglasses jewellery]
    man_color = 'black'
    man_sizes = %w[S M L XL XXL]

    p '-------make woman products---------'
    woman_clothes_categories.each do |cat|
      category = Category.joins(category_type: :main_category).where(main_categories: {name: 'woman'}).where(category_types: {name: 'clothes'}).where(name: cat).first
      cat = cat.gsub(/-/, '')
      2.times do |n|
        n += 1
        product = Product.create(name: cat+'_'+n.to_s, price: rand(10..100), composition: "100% cotton", category: category)
        product_color = ProductColor.new(color: woman_color, product: product)
        if Rails.env.production?
          product_color.remote_image_url = 'https://s3-eu-west-1.amazonaws.com/shop-app/seed/woman/'+woman_color+'.jpg'
          product_color.images = [open('https://s3-eu-west-1.amazonaws.com/shop-app/seed/woman/clothes/'+cat+'/'+cat+'_'+n.to_s+'.1.jpg'), open('https://s3-eu-west-1.amazonaws.com/shop-app/seed/woman/clothes/'+cat+'/'+cat+'_'+n.to_s+'.2.jpg')]
        else
          product_color.image = File.open('/home/mars/ruby/shop_pic/woman/'+woman_color+'.jpg')
          product_color.images = [File.open('/home/mars/ruby/shop_pic/woman/clothes/'+cat+'/'+cat+'_'+n.to_s+'.1.jpg'), File.open('/home/mars/ruby/shop_pic/woman/clothes/'+cat+'/'+cat+'_'+n.to_s+'.2.jpg')]
        end
        product_color.save
        woman_sizes.each do |size|
          product_size = ProductSize.create(size: size, quantity: 100, product_color: product_color)
        end
      end
    end
    woman_accessories_categories.each do |cat|
      category = Category.joins(category_type: :main_category).where(main_categories: {name: 'woman'}).where(category_types: {name: 'accessories'}).where(name: cat).first
      cat = cat.gsub(/-/, '')
      2.times do |n|
        n += 1
        product = Product.create(name: cat+'_'+n.to_s, price: rand(10..100), composition: "100% cotton", category: category)
        product_color = ProductColor.new(color: woman_color, product: product)
        if Rails.env.production?
          product_color.remote_image_url = 'https://s3-eu-west-1.amazonaws.com/shop-app/seed/woman/'+woman_color+'.jpg'
          product_color.images = [open('https://s3-eu-west-1.amazonaws.com/shop-app/seed/woman/accessories/'+cat+'/'+cat+'_'+n.to_s+'.1.jpg'), open('https://s3-eu-west-1.amazonaws.com/shop-app/seed/woman/accessories/'+cat+'/'+cat+'_'+n.to_s+'.2.jpg')]
        else
          product_color.image = File.open('/home/mars/ruby/shop_pic/woman/'+woman_color+'.jpg')
          product_color.images = [File.open('/home/mars/ruby/shop_pic/woman/accessories/'+cat+'/'+cat+'_'+n.to_s+'.1.jpg'), File.open('/home/mars/ruby/shop_pic/woman/accessories/'+cat+'/'+cat+'_'+n.to_s+'.2.jpg')]
        end
        product_color.save
        woman_sizes.each do |size|
          product_size = ProductSize.create(size: size, quantity: 100, product_color: product_color)
        end
      end
    end

    man_clothes_categories.each do |cat|
      category = Category.joins(category_type: :main_category).where(main_categories: {name: 'man'}).where(category_types: {name: 'clothes'}).where(name: cat).first
      cat = cat.gsub(/-/, '')
      2.times do |n|
        n += 1
        product = Product.create(name: cat+'_'+n.to_s, price: rand(10..100), composition: "100% cotton", category: category)
        product_color = ProductColor.new(color: man_color, product: product)
        if Rails.env.production?
          product_color.remote_image_url = 'https://s3-eu-west-1.amazonaws.com/shop-app/seed/man/'+man_color+'.jpg'
          product_color.images = [open('https://s3-eu-west-1.amazonaws.com/shop-app/seed/man/clothes/'+cat+'/'+cat+'_'+n.to_s+'.1.jpg'), open('https://s3-eu-west-1.amazonaws.com/shop-app/seed/man/clothes/'+cat+'/'+cat+'_'+n.to_s+'.2.jpg')]
        else
          product_color.image = File.open('/home/mars/ruby/shop_pic/man/'+man_color+'.jpg')
          product_color.images = [File.open('/home/mars/ruby/shop_pic/man/clothes/'+cat+'/'+cat+'_'+n.to_s+'.1.jpg'), File.open('/home/mars/ruby/shop_pic/man/clothes/'+cat+'/'+cat+'_'+n.to_s+'.2.jpg')]
        end
        product_color.save
        man_sizes.each do |size|
          product_size = ProductSize.create(size: size, quantity: 100, product_color: product_color)
        end
      end
    end
    man_accessories_categories.each do |cat|
      category = Category.joins(category_type: :main_category).where(main_categories: {name: 'man'}).where(category_types: {name: 'accessories'}).where(name: cat).first
      cat = cat.gsub(/-/, '')
      2.times do |n|
        n += 1
        product = Product.create(name: cat+'_'+n.to_s, price: rand(10..100), composition: "100% cotton", category: category)
        product_color = ProductColor.new(color: man_color, product: product)
        if Rails.env.production?
          product_color.remote_image_url = 'https://s3-eu-west-1.amazonaws.com/shop-app/seed/man/'+man_color+'.jpg'
          product_color.images = [open('https://s3-eu-west-1.amazonaws.com/shop-app/seed/man/accessories/'+cat+'/'+cat+'_'+n.to_s+'.1.jpg'), open('https://s3-eu-west-1.amazonaws.com/shop-app/seed/man/accessories/'+cat+'/'+cat+'_'+n.to_s+'.2.jpg')]
        else
          product_color.image = File.open('/home/mars/ruby/shop_pic/man/'+man_color+'.jpg')
          product_color.images = [File.open('/home/mars/ruby/shop_pic/man/accessories/'+cat+'/'+cat+'_'+n.to_s+'.1.jpg'), File.open('/home/mars/ruby/shop_pic/man/accessories/'+cat+'/'+cat+'_'+n.to_s+'.2.jpg')]
        end
        product_color.save
        man_sizes.each do |size|
          product_size = ProductSize.create(size: size, quantity: 100, product_color: product_color)
        end
      end
    end
  end

end
