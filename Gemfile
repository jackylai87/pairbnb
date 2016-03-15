# ruby 2.2.3

source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.5'

# Use postgres as the database for Active Record
gem 'pg'

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
gem 'jquery-turbolinks'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'

# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Figaro to ignore all sensitive data being uploaded in Git
gem 'figaro'

# Devise allowing users to sign-up, sign-in and more
gem 'devise'

# Omniauth allows users signing up and signing in by user's social accounts 
gem 'omniauth'

# And Omniauth Facebook is for Facebook
gem 'omniauth-facebook'

# Carrierwave pointing to master branch to enable multiple upload.
gem 'carrierwave', github: 'carrierwaveuploader/carrierwave'

# Mini-Magick to minimize images uploaded in larger size
gem 'mini_magick'

# Fog-Aws to store all images uploaded
gem 'fog-aws'

# Cloudinary handles all imaging upload and editing to Cloudinary Server 
# (May not need Carrierwave, Mini-Magick and Fog-Aws)
gem 'cloudinary'

# Sidekiq do all the backend mailing
gem 'sidekiq'

# Sinatra needed to show statistics of mail being sent by sidekiq
gem 'sinatra', :require => nil

# Braintree for payment gateway
gem 'braintree'

# Gon allows us to set variables in our controllers and then access them from JavaScript
gem 'gon'

# Geocoder is a complete geocoding solution for Ruby
gem 'geocoder'

# Gem for Bootstrap
gem 'bootstrap-sass'
gem 'autoprefixer-rails'

# Searchkick allows search function in our app
gem 'searchkick'

# Search by emoji
gem 'gemoji-parser'

# A tagging plugin for Rails applications that allows for custom tagging along dynamic contexts
gem 'acts-as-taggable-on'

# Manage Procfile-based applications, Enable all servers at one click
gem 'foreman'

# To paginate listing
gem 'will_paginate'

# To show messages in js
gem 'toastr_rails'

# Private Pub is a Ruby gem for use with Rails to publish and subscribe to messages through Faye. 
# It allows you to easily provide real-time updates through an open socket without tying up a 
# Rails process. All channels are private so users can only listen to events you subscribe them to.
gem 'private_pub'

# A very fast & simple Ruby web server
gem 'thin'

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :production do
  gem 'rails_12factor'
end

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  gem "better_errors"
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end
