source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

ruby '3.2.2'

gem 'coffee-rails', '~> 4.2'
gem 'haml', '>=3.0.0'
# gem 'pg', '~> 0.18'
gem 'pg', '~> 1.5', '>= 1.5.4'
gem 'puma', '~> 3.0'
gem 'rails', '~> 7.1.2'
gem 'sass-rails', '~> 6.0'
gem 'uglifier', '>= 4.2.0'
# gem 'therubyracer', platforms: :ruby
gem 'jbuilder', '~> 2.11.5'
gem 'jquery-rails', '4.6.0'
gem 'turbolinks', '~> 5.2.1'
# gem 'redis', '~> 3.0'
gem 'bootstrap-email', '1.4.1'
gem 'devise', '4.9.3'
gem 'email_address', '0.2.4'
gem 'ipinfo-rails', '1.0.1'
gem 'simple_calendar', '~> 3.0.2'

# gem 'capistrano-rails', group: :development

group :development, :test do
  gem 'byebug', platform: :mri
end

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'erb2haml'
  gem 'listen', '>= 3.5'
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
