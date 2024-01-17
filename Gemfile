source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.2.0"

gem "rails", "~> 7.0.0"
gem "sprockets-rails"
gem "mysql2", "~> 0.5"
gem "puma", "~> 5.0"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "jbuilder"
# gem "redis", "~> 4.0"
# gem "kredis"
# gem "bcrypt", "~> 3.1.7"
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]
gem "bootsnap", require: false
# gem "sassc-rails"
# gem "image_processing", "~> 1.2"

group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
  gem 'rspec-rails', '~> 4.0.0'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'faker-japanese'
end

group :development do
  gem "web-console"
  # gem "rack-mini-profiler"
  # gem "spring"
  gem 'rubocop', require: false
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
end

group :production do
  gem 'pg'
end

gem 'devise'
gem 'image_processing', '~> 1.2' # 画像処理用のgem
gem 'active_hash'
gem 'ruby-vips'