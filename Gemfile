source 'https://rubygems.org'

gem 'rails', '4.1.4'
gem 'mysql2'

group :production do
  gem "pg"
  gem 'rails_12factor'
end

# AUTHENTICATION
gem 'devise'

gem 'jquery-rails'
gem 'jquery-ui-rails'

gem 'simple_form'
gem 'nested_form'

gem 'haml-rails'
gem 'haml'
gem "highcharts-rails", "~> 3.0.0"

group :assets do
  gem 'uglifier'
end

gem 'bootstrap-sass', '~> 3.3.3'
gem 'sass-rails', '>= 3.2'
gem 'sprockets-rails'

gem 'aasm', '3.3.3'
gem 'will_paginate'
gem 'geocoder'

gem 'jbuilder' # used for serialization of models into JSON

group :development, :test do
  gem 'pry'
  gem 'pry-doc'

  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'capybara'
  gem 'database_cleaner'
  gem 'shoulda-matchers', require: false
  gem 'rspec-collection_matchers'
  gem 'quiet_assets'
  gem 'bullet'
end

group :test do
  gem 'ffaker'
  gem 'capybara-webkit'
  gem "simplecov"
  # coverege
  gem 'metric_fu'
  gem 'rails_best_practices'
  gem 'reek'
end
