source 'http://rubygems.org'

ruby '2.3.1'

gem 'rails', '~> 5.0.0'
gem 'pg'
gem 'puma', '~> 3.0'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'jquery-rails'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'

gem 'bootstrap-sass', '~> 3.3.5'
gem 'bourbon', '4.2.3'
gem 'neat', '1.7.2'
watt_gem_spec = { git: 'https://github.com/artsy/watt.git', branch: 'master' }
gem 'watt', '0.0.9', watt_gem_spec

gem 'haml-rails'

gem 'friendly_id', '~> 5.1.0'

gem 'redcarpet'

gem 'newrelic_rpm'

group :development, :test do
  gem 'byebug', platform: :mri
  gem 'rspec-rails'
  gem 'webmock'
  gem 'dotenv-rails', require: 'dotenv/rails-now'
end

group :development do
  gem 'web-console'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
