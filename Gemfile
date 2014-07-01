source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.1'
# Use sqlite3 as the database for Active Record
gem 'sqlite3'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.3'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer',  platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0',          group: :doc

# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
gem 'spring',        group: :development

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]


# gem for OAuth
gem 'omniauth', '~> 1.2.1'
gem 'omniauth-twitter', '~> 1.0.1'

# gem for Pager
gem 'kaminari', '~> 0.15.1'
gem 'kaminari-bootstrap', '~> 3.0.1'

# gem for Search library
gem 'ransack', '~> 1.2.2'

# gem for Image UPload
gem 'carrierwave', '~> 0.10.0'
gem 'mini_magick', '~> 3.7.0'

gem 'rspec'
gem 'serverspec'

group :development do
  gem 'capistrano', "3.2.1"
  gem 'capistrano-rails'
  gem 'capistrano-bundler'
  gem 'capistrano3-unicorn'
  #gem 'capistrano-rbenv', "~> 2.0"
  gem 'rvm1-capistrano3', require: false
end

group :development, :test do
  gem 'rspec-rails', '~> 3.0.0'
  gem 'rspec-core', '~> 3.0.0'
  gem 'rspec-expectations', '~> 3.0.0'
  gem 'rspec-mocks', '~> 3.0.0'
  gem 'rspec-support', '~> 3.0.0'
  gem 'factory_girl_rails'
  gem 'chef'
  gem 'knife-solo'
  gem 'berkshelf'
end

group :test do
	gem 'shoulda-matchers', '~> 2.6.0'
	gem 'capybara', '~> 2.2.1'
	gem 'poltergeist', '~> 1.5.0'
  gem 'database_cleaner', '~> 1.2.0'
  gem 'simplecov'
  gem 'rails_best_practices'
end

group :staging, :production do
  gem 'unicorn'
end
