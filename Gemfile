source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.2.2"

gem "rails", "~> 7.1.2"
gem "sprockets-rails"
gem "pg", "~> 1.1"
gem "puma", "~> 6.4"
gem "jsbundling-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "cssbundling-rails"
gem "jbuilder"
gem "sidekiq", "~> 7.2"
gem "redis", "~> 5.0"
# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

group :development, :test do
  gem "bootsnap", require: false
  gem 'byebug'
  gem 'pry-rails'
end

group :development do
  gem "web-console"
  gem "rack-mini-profiler"
  gem "web-console"
  gem "better_errors"
  gem "binding_of_caller"
  gem "letter_opener"
  gem "bullet"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
  gem 'rspec-rails', '~> 6.1.0'
  gem "shoulda-matchers", "~> 5.0.0"
  gem "timecop", "~> 0.9.4"
  gem "factory_bot_rails"
  gem "capybara-screenshot"
end
