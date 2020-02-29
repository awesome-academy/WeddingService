source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.6.4"

gem "rails", "~> 5.2.3"
gem "puma", "~> 3.12"
gem "sass-rails", "~> 5.0"
gem "uglifier", ">= 1.3.0"
gem "coffee-rails", "~> 4.2"
gem "turbolinks", "~> 5"
gem "jbuilder", "~> 2.5"
gem "devise"
gem "bootsnap", ">= 1.1.0", require: false
gem "bootstrap"
gem "rails-i18n"
gem "jquery-rails"
gem "omniauth"
gem "omniauth-google-oauth2"
gem "omniauth-facebook"
gem "figaro"
gem "cancancan"
gem "rails_admin"
gem "pagy"
gem "mini_magick"
gem "carrierwave"
gem "ckeditor", "4.2.0"
gem "bootstrap-sass"
gem "amoeba"

group :development, :test do
  gem "sqlite3"
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem "web-console", ">= 3.3.0"
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end

group :test do
  gem "capybara", ">= 2.15"
  gem "selenium-webdriver"
  gem "chromedriver-helper"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]