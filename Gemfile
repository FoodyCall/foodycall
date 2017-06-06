source 'https://rubygems.org'
ruby '2.3.4'

gem 'minitest'
gem 'rake'
gem 'sinatra'
gem 'thin'
gem 'json'
gem 'hirb'
gem 'sequel'

group :test do
  gem 'rack'
  gem 'rack-test'
  gem 'watir'
  gem 'headless'
  gem 'page-object'
  gem 'tux'
end

group :development, :test do
  gem 'sqlite3'
  gem 'config_env'
end

group :production do
  gem 'pg'
end
