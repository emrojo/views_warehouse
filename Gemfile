source 'https://rubygems.org'

gem 'bootsnap'
gem 'mysql2'

# We hardly use any of the features of Rails, so lets just load what we need
# Initially installed with
#gem 'rails', '~> 6.0'
# And then extracted the dependencies from the Gemfile.lock
# I've removed those we don't need. If reinstating a dependency try and match
# the version to those already included.
# A full list of rails components can be found in the Gemfile:
# https://github.com/rails/rails/blob/master/rails.gemspec
#
# Be aware when adding in new components that they may require an initializer
# or additional configuration options.
# RAILS DEPENDENCIES
gem 'activemodel', '~> 6.0.3'
gem 'activerecord', '~> 6.0.3'
gem 'activesupport', '~> 6.0.3'
gem 'bundler', '>= 1.3.0'
gem 'railties', '~> 6.0.3'
# # RAILS DEPENDENCIES

gem 'views_schema', github: 'emrojo/views_schema', branch: 'main'


group :test, :development do
  gem 'factory_bot_rails'
  gem 'pry'
  gem 'rspec-rails'
  gem 'simplecov', require: false
end

group :development do
  gem 'rubocop', require: false
  gem 'rubocop-performance', require: false
  gem 'rubocop-rails', require: false
end
