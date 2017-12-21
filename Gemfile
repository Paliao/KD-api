source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'cancancan', '~> 2.0'
gem 'devise'
gem 'devise_token_auth'
gem 'omniauth-facebook'
gem 'puma', '~> 3.7'
gem 'rails', '~> 5.1.4'
gem 'rubocop', require: false
gem 'rubocop-rails'
gem "rubycritic", require: false
gem 'sqlite3'

group :development, :test do
  gem 'byebug'
end

group :development do
  gem 'factory_bot_rails'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'meta_request'
  gem 'pry-rails'
  gem 'rspec-rails', '~> 3.6'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
