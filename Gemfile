source 'https://rubygems.org'
ruby '2.4.1'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.0.2'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.0'
gem 'redis', '~> 3.0'

gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'jquery-rails'
gem 'turbolinks', '~> 5'
gem 'bootstrap', '~> 4.0.0.alpha6'
gem 'select2-rails', '4.0.3'
gem 'jquery-turbolinks', '~> 2.1.0'
gem 'slim-rails', '~> 3.1.2'
gem 'font-awesome-sass', '~> 4.7.0'

source 'https://rails-assets.org' do
  gem 'rails-assets-tether', '>= 1.3.3'
end

gem 'figaro'
gem 'devise', '4.2.1'
gem 'will_paginate', '~> 3.1.0'
gem 'pundit', '1.1.0'
gem 'pg_search', '~> 2.0.1'

group :development, :test do
  gem 'byebug'
  gem 'factory_girl_rails'
  gem 'rspec-rails', '~> 3.5'
  gem 'spring'
  gem 'launchy'
  gem 'ffaker'
end

group :test do
  gem 'capybara', '~> 2.8'
  gem 'capybara-screenshot', '~> 1.0.14'
  gem 'poltergeist', '~> 1.12.0'
  gem 'database_cleaner', '~> 1.3'
  gem 'shoulda-matchers', '~> 2.8'
  gem 'codeclimate-test-reporter', require: nil
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'bullet'
  gem 'switch_user'
  gem 'annotate'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
