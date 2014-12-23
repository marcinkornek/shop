# namespace :db do
#   desc "Fill database with sample data"
#   task populate: :environment do
#     Rake::Task["db:reset"].invoke if Rails.env.development?
#     make_users
    # make_posts
    # make_comments
  # end

  # def make_users
  #   puts "---------creating users--------------------"
  #   user = User.new(
  #                username: "mars124",
  #                email: "mars124@o2.pl",
  #                password: "asdasdasd",
  #                password_confirmation: "asdasdasd",
  #                )
  #   user.send_activation_email = false
  #   user.save
  #   user.activate!

  #   99.times do |n|
  #     username  = "test#{n+1}"
  #     email = "test#{n+1}@o3.pl"
  #     password  = "asdasdasd"
  #     user = User.new(
  #                  username: username,
  #                  email: email,
  #                  password: password,
  #                  password_confirmation: password,
  #                  )
  #     user.send_activation_email = false
  #     user.save
  #     user.activate!
  #   end
  # end

  # def make_posts
  #   puts "---------creating posts---------------"
  #   users = User.all.order(:id).limit(6)
  #   50.times do
  #     title = Faker::Address.country
  #     contents = Faker::Lorem.sentence(20)
  #     users.each { |user| user.posts.create!(
  #                                           title: title,
  #                                           contents: "Post #{contents}"
  #                                           ) }
  #   end
  # end

  # def make_comments
  #   puts "---------creating comments---------------"
  #   users = User.all.order(:id).limit(6)
  #   # puts users.pluck(:id)

  #   21.times do |n|
  #     n += 1
  #     contents = Faker::Lorem.sentence(30)
  #     users.each { |user| user.posts.each {|post| post.comments.create!(
  #                                                       contents: "Comment #{contents}",
  #                                                       user_id: n
  #                                                       ) }
  #                 }
  #   end
  # end

# end
