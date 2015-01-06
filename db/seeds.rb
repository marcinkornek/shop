Rake::Task["db:reset"].invoke if Rails.env.development?

woman_clothes_categories = %w[outerwear jackets sweaters sweatshirts blouses shirts t-shirts dresses skirts trousers jeans shorts lingerie]
woman_accessories_categories = %w[bags shoes hats scarves belts gloves sunglasses jewellery]

man_clothes_categories = %w[outerwear jackets sweaters sweatshirts shirts t-shirts polos trousers jeans shorts lingerie]
man_accessories_categories = %w[bags shoes hats scarves ties belts gloves sunglasses jewellery]


p '-------make women---------'
mc = MainCategory.create(name: 'woman')

ct = CategoryType.create(name: 'clothes', main_category: mc)
woman_clothes_categories.each do |cat|
  Category.create(name: cat, category_type: ct )
end

ct = CategoryType.create(name: 'accessories', main_category: mc)
woman_accessories_categories.each do |cat|
  Category.create(name: cat, category_type: ct)
end


p '-------make men---------'
mc = MainCategory.create(name: 'man')

ct = CategoryType.create(name: 'clothes', main_category: mc)
man_clothes_categories.each do |cat|
  Category.create(name: cat, category_type: ct )
end

ct = CategoryType.create(name: 'accessories', main_category: mc)
man_accessories_categories.each do |cat|
  Category.create(name: cat, category_type: ct)
end
