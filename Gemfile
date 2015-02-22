source 'https://rubygems.org'
ruby '2.1.4'

gem 'rails', '4.1.8'
gem 'pg'

gem 'slim-rails'
gem 'figaro'
gem 'sorcery', '~> 0.8.6'
gem 'omniauth-google-oauth2'
gem 'omniauth-facebook'
gem 'angular_rails_csrf'
gem 'roar-rails', '~> 0.1.6' # representer - extends/fits json files
gem 'jquery-rails'
gem 'carrierwave', :git => "git://github.com/carrierwaveuploader/carrierwave.git", :branch => "master"
gem 'rmagick'
gem 'fog' # Ruby cloud services library

# assets processors
gem 'sass-rails'
gem 'uglifier'
gem 'coffee-rails'
gem 'coffee-rails-source-maps'
gem 'execjs'
gem 'ngannotate-rails'
gem 'autoprefixer-rails'
gem 'will_paginate'

# assets
source 'https://rails-assets.org' do
  gem 'rails-assets-lodash'
  gem 'rails-assets-angular'
  gem 'rails-assets-angular-cache', '~> 2.3.4'
  gem 'rails-assets-angular-ui-router'
  gem 'rails-assets-angular-resource'
  gem 'rails-assets-angular-translate'
  gem 'rails-assets-angular-animate'
  gem 'rails-assets-angular-touch'
  gem 'rails-assets-angular-bootstrap'
  gem 'rails-assets-bootstrap'
  gem 'rails-assets-Font-Awesome'
  gem 'rails-assets-angular-cookies'
  gem 'rails-assets-angular-carousel'
  gem 'rails-assets-ngInfiniteScroll'
end

group :development, :test do
  gem 'spring'
  gem 'pry-rails'
  gem 'quiet_assets'
  gem 'rspec-rails', '~> 2.14.0.rc1'
  gem 'faker'
end

group :production do
  gem 'rails_12factor'
end

group :development do
  gem 'better_errors'
  gem "letter_opener"
end

group :test do
  gem 'capybara'
  gem 'factory_girl_rails'
end
