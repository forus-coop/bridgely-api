source 'https://rubygems.org'

ruby "2.0.0"

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.0'

gem 'rails-api'
gem "active_model_serializers"

gem 'devise'

# Use Twillio
gem 'twilio-ruby'

# To use ActiveModel has_secure_password
gem 'bcrypt-ruby', '~> 3.0.0'

# Env Variable management
gem 'figaro'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano', :group => :development
group :test, :development do
  gem "rspec-rails"
  gem 'guard-rspec'
  gem 'debugger'
  gem 'sqlite3'
end

group :test do
  gem "factory_girl_rails", ">= 4.0.0"
  gem "capybara"
#  gem 'rb-fsevent', :require => false if RUBY_PLATFORM =~ /darwin/i
end

group :development do
  gem 'guard-bundler'
end

# Heroku gems
group :production do
  gem 'rails_12factor'
  gem 'pg'
end
