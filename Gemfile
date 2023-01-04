# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.0'

gem 'importmap-rails'
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'rails', '~> 7.0.4'
gem 'sorcery', '~> 0.16.4'
gem 'sprockets-rails'
gem 'stimulus-rails'
gem 'tailwindcss-rails'
gem 'turbo-rails'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

group :development, :test do
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  gem 'dotenv-rails', '~> 2.8'
  gem 'factory_bot_rails', '~> 6.2'
  gem 'faker', '~> 3.1'
  gem 'rubocop-rails', '~> 2.17'
end

group :development do
  gem 'letter_opener', '~> 1.8', '>= 1.8.1'
  gem 'web-console'
end

group :test do
  gem 'capybara', '~> 3.38'
  gem 'database_cleaner-active_record', '~> 2.0', '>= 2.0.1'
  gem 'rspec-rails', '~> 6.0', '>= 6.0.1'
  gem 'selenium-webdriver', '~> 4.7', '>= 4.7.1'
  gem 'vcr', '~> 6.1'
  gem 'webdrivers', '~> 5.2'
  gem 'webmock', '~> 3.18', '>= 3.18.1'
end
