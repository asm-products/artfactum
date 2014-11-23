source 'https://rubygems.org'
ruby '2.1.2'

gem 'rails', '4.1.6'

gem 'pg'
gem 'sass-rails'
gem 'uglifier'
gem 'coffee-rails'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0', group: :doc
gem 'recipient_interceptor'
gem 'high_voltage'
gem 'i18n-tasks'
gem 'title'

# Authentication
gem 'devise'

# Uploading
gem 'carrierwave'
gem 'carrierwave-aws'

gem 'bootstrap-sass', '~> 3.2.0'
gem 'font-awesome-sass'
gem 'autoprefixer-rails'
gem 'kaminari'
gem 'has_scope'
gem 'ransack'

gem 'simple_form'
gem 'draper'

# Social Networking
gem 'acts_as_follower'
gem 'acts_as_commentable_with_threading'
gem 'acts_as_votable'
gem 'public_activity'

group :staging, :production do
  gem 'rails_12factor'
  gem 'rails_serve_static_assets'
  gem 'airbrake'
  gem 'newrelic_rpm'
end

group :test do
  gem 'database_cleaner'
  gem 'codeclimate-test-reporter', require: nil
  gem 'shoulda-matchers', require: false
  gem 'simplecov'
  gem 'faker'
  gem 'capybara'
  gem 'capybara-webkit'
  gem 'capybara-screenshot'
  gem 'capybara-angular'
  gem 'launchy'
  gem 'webmock'
  gem 'formulaic'
  gem 'vcr'
  gem 'bullet'
end

group :test, :development do
  gem 'web-console', '~> 2.0.0.beta4'
  gem 'rspec'
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'assert_difference'
  gem 'byebug'
  gem 'pry'
  gem 'pry-byebug'
  gem 'pry-remote'
  gem 'dotenv-rails'
  gem 'fuubar'
  gem 'rubocop'
end

group :development do
  gem 'annotate', '~> 2.6.5'
  gem 'quiet_assets'
  gem 'guard'
  gem 'guard-rspec', require: false
  gem 'guard-rubocop'
  gem 'guard-rails'
  gem 'guard-bundler'
  gem 'guard-puma'
  gem 'spring'
  gem 'spring-commands-rspec'
  gem 'rb-fsevent', require: false
  gem 'better_errors'
  gem 'binding_of_caller'
end

group :development, :production do
  gem 'puma'
end
