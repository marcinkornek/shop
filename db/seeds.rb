Rake::Task["db:reset"].invoke if Rails.env.development?

woman_clothes_categories = %w[outerwear jackets sweaters sweatshirts blouses shirts t-shirts dresses skirts trousers jeans shorts lingerie]
woman_accessories_categories = %w[bags shoes hats scarves belts gloves sunglasses jewellery]

man_clothes_categories = %w[outerwear jackets sweaters sweatshirts shirts t-shirts polos trousers jeans shorts lingerie]
man_accessories_categories = %w[bags shoes hats scarves ties belts gloves sunglasses jewellery]


p '-------make women---------'
mcn = 'woman'
mc = MainCategory.new(name: mcn)
if Rails.env.production?
  mc.remote_image_url = 'https://s3-eu-west-1.amazonaws.com/shop-app/seed/'+mcn+'/'+mcn+'.jpg'
else
  mc.image = File.open('/home/mars/ruby/shop_pic/'+mcn+'/'+mcn+'.jpg')
end

ct = CategoryType.new(name: 'clothes', main_category: mc)
woman_clothes_categories.each do |cat|
  Category.create(name: cat, category_type: ct )
end

ct = CategoryType.new(name: 'accessories', main_category: mc)
woman_accessories_categories.each do |cat|
  Category.create(name: cat, category_type: ct)
end


p '-------make men---------'
mcn = 'man'
mc = MainCategory.new(name: mcn)
if Rails.env.production?
  mc.remote_image_url = 'https://s3-eu-west-1.amazonaws.com/shop-app/seed/'+mcn+'/'+mcn+'.jpg'
else
  mc.image = File.open('/home/mars/ruby/shop_pic/'+mcn+'/'+mcn+'.jpg')
end

ct = CategoryType.new(name: 'clothes', main_category: mc)
man_clothes_categories.each do |cat|
  Category.create(name: cat, category_type: ct )
end

ct = CategoryType.new(name: 'accessories', main_category: mc)
man_accessories_categories.each do |cat|
  Category.create(name: cat, category_type: ct)
end
