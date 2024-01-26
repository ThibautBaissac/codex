source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.2.2"

gem "administrate"
gem "bcrypt", "~> 3.1.7"
gem "chartkick"
gem "cssbundling-rails"
gem "groupdate"
gem "image_processing", "~> 1.2"
gem "jbuilder"
gem "jsbundling-rails"
gem "pagy", "~> 6.2"
gem "pg", "~> 1.1"
gem "puma", "~> 6.4"
gem "pundit", "~> 2.3", ">= 2.3.1"
gem "rails", "~> 7.1.3"
gem "redis", "~> 5.0"
gem "sidekiq", "~> 7.2"
gem "simple_command"
gem "slug"
gem "sprockets-rails"
gem "stimulus-rails"
gem "turbo-rails"
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby] # Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "view_component"
# gem "kredis" # Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]

group :development, :test do
  gem "bootsnap", require: false
  gem "byebug"
  gem "factory_bot_rails"
  gem "pry-rails"
  gem "rails-controller-testing"
  gem "rspec-rails", "~> 6.1.0"
  gem "shoulda-matchers", "~> 5.0.0"
end

group :development do
  gem "better_errors"
  gem "binding_of_caller"
  gem "bullet"
  gem "letter_opener"
  gem "rack-mini-profiler"
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "capybara-screenshot"
  gem "selenium-webdriver"
  gem "timecop", "~> 0.9.4"
  gem "webdrivers"
end
