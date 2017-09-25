source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails' , '>= 5.0.0.rc2', '< 5.1.4'
gem 'bundler', '>= 1.8.4'
# Use sqlite3 as the database for Active Record
#gem 'sqlite3'
#gem 'taps'
# Use Puma as the app server
gem 'puma', '~> 3.0'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby
#gem 'kaminari'
gem 'activeadmin', '~> 1.1'
gem 'active_admin_theme'
gem 'fullcalendar-rails'
gem 'momentjs-rails'
gem 'paperclip', '~> 5.0'
#gem 'rmagick', '~> 2.15'
#gem "active_admin-sortable_tree"
gem 'active_admin_importable'
gem 'inherited_resources', github: 'activeadmin/inherited_resources'
gem 'activeadmin_addons'
gem 'responders', '~> 2.2'
gem 'gmaps4rails'
gem 'underscore-rails'
gem 'geocoder'
gem 'google-api-client',  require: 'google/apis/calendar_v3'
gem 'omniauth-google-oauth2'
#gem 'pundit'
#gem cancancan
gem 'figaro'
gem 'high_voltage', '~> 3.0.0'
# Use jquery as the JavaScript library
gem 'rails-assets-jquery', source: 'https://rails-assets.org'
gem 'rails-assets-datatables', source: 'https://rails-assets.org'

gem 'jquery-ui-rails', '5.0.5'
gem 'jquery-rails'
gem 'bootstrap-datepicker-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'
gem 'font-awesome-sass'
gem 'bootstrap-sass', '~>3.3.6'
gem 'devise', '~>4.2.0'
#gem 'cancancan', '~> 1.10'
gem 'activerecord-import', '~> 0.19.1'
gem 'd3-rails','4.1.0'
gem 'will_paginate-bootstrap', '~> 1.0.1'
gem 'everett'


group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
  gem 'rspec-rails', '3.5.1'
end

group :development do
  #gem 'sqlite3'
  gem "better_errors"
  gem "binding_of_caller"
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'

  gem 'guard', '~>2.14.0'
  gem 'guard-rspec', '~> 4.7.2'
  gem 'guard-cucumber', '~> 2.1.2'
end

group :production do
  gem 'pg'
  # Use Capistrano for deployment
  gem 'capistrano', '~> 3.6'
  gem 'capistrano-rails', group: :development
end

group :test do
  gem 'capybara', '2.7.1'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
