source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.6'
# Use sqlite3 as the database for Active Record
# sqlite 3 not working on heroku
#gem 'sqlite3'
gem "pg"

group :development, :test do
  gem "sqlite3"
end
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

gem 'devise', '~>3.5.10'
gem 'devise_roles'
gem 'bootstrap-sass', '~> 3.1.1.0'
gem 'pundit'

#for uploading pictures
gem 'carrierwave', '~> 0.10.0'
gem 'mini_magick', '~> 4.3'

#for viewing pictures
gem "jquery-slick-rails"





group :development, :test do
  gem 'rails_layout'
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem "bootstrap-sass-rails", "~> 2.2.2.0"
gem 'rspec'
group :test do
  gem 'cucumber-rails', :require => false
  # database_cleaner is not required, but highly recommended
  gem 'database_cleaner'
end

end


group :test, :development do
  gem 'rspec-rails'
  gem 'cucumber-rails', :require => false
  gem 'capybara'
  gem 'database_cleaner'
  gem "codeclimate-test-reporter", group: :test
  gem 'simplecov', :require => false, :group => :test
end





