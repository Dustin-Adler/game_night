source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'coffee-rails', '~> 4.2'
gem 'haml', '>=3.0.0'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.0'
gem 'rails', '~> 5.0.6'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
# gem 'therubyracer', platforms: :ruby
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails'
gem 'turbolinks', '~> 5'
# gem 'redis', '~> 3.0'
gem 'bootstrap-email'
gem 'devise'
gem 'email_address'
gem 'ipinfo-rails'
gem 'simple_calendar', '~> 2.4'

# gem 'capistrano-rails', group: :development

group :development, :test do
  gem 'byebug', platform: :mri
end

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'erb2haml'
  gem 'listen', '~> 3.0.5'
  gem 'pry-rails'
  gem 'rubocop', '~> 0.52.1'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'capybara'
  gem 'cucumber'
  gem 'cucumber-rails', require: false
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
