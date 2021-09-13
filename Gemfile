source 'https://rubygems.org'

git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.4'

gem 'addressable', '~> 2.4'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'carrierwave', '~> 1.0'
gem 'carrierwave_direct'
gem 'clearance', '~> 2.5.0'
gem 'dotenv-rails'
gem 'exception_notification'
gem 'fog', '~> 1.38' # cloud services library for AWS s3
gem 'geocoder'
gem 'jbuilder', '~> 2.5'
gem 'mini_magick', '~> 4.8'
gem 'pg'
gem 'puma', '~> 3.11'
gem 'rails', '~> 5.2.6'
gem 'redis', '~> 4.0'
gem 'sass-rails', '~> 5.0'
gem 'sdoc', '~> 0.4.0', group: :doc
gem 'uglifier', '>= 1.3.0'


group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec-rails'
  gem 'faker', '~> 1.7', '>= 1.7.2'
  gem 'database_cleaner'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  # Easy installation and use of chromedriver to run system tests with Chrome
  gem 'chromedriver-helper'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
