source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.1'

gem 'rails', '~> 6.0.3', '>= 6.0.3.4'
#gem 'sqlite3', '~> 1.4'

# Auth page
gem 'jwt'
gem 'sorcery'

# Admin panel
gem 'activeadmin'
gem 'devise'

gem 'mimemagic', github: 'mimemagicrb/mimemagic', ref: '01f92d86d15d85cfd0f20dabd025dcbd36a8a60f'

# Add roles in API
gem 'cancancan'
gem 'rolify'

# API framework
gem 'grape'
gem 'grape-entity'
gem 'grape-swagger'

# Debugger
gem 'pry-rails'

# Add picture to profile
gem 'carrierwave', '~> 2.0'

# For frontend
gem 'rack-cors'

gem 'puma', '~> 4.1'
gem 'sass-rails', '>= 6'
gem 'pg'
gem 'webpacker', '~> 4.0'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.7'
gem 'bootsnap', '>= 1.4.2', require: false
gem 'awesome_print'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
# gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
