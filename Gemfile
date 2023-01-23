source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.2"
gem "rails", "~> 7.0.4"
gem "sprockets-rails"
gem "sqlite3", "~> 1.4"
gem "puma", "~> 5.0"
gem "jsbundling-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "cssbundling-rails"
gem "jbuilder"
gem "devise"
gem "devise-i18n"
gem "rails-i18n"
gem "carrierwave"
gem "rmagick"
gem "mailjet"
gem "dotenv-rails"
gem "pundit"
gem "resque", "~> 2.4"
gem "omniauth"
gem 'omniauth-rails_csrf_protection'
gem "omniauth-github"
gem "omniauth-vkontakte"
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]
gem "bootsnap", require: false

group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
  gem "rspec-rails"
  gem "factory_bot_rails"
end

group :development do
  gem "web-console"
  gem "capistrano", "~> 3.10"
  gem "capistrano-rails", "~> 1.6"
  gem "capistrano-passenger", "~> 0.2"
  gem "capistrano-rbenv", "~> 2.2"
  gem "capistrano-bundler", "~> 2.1"
  gem "capistrano-resque", "~> 0.2.3", require: false

  gem "net-ssh", ">= 6.0.2"
  gem "ed25519", ">= 1.2", "< 2.0"
  gem "bcrypt_pbkdf", ">= 1.0", "< 2.0"
end

group :production do
  gem "pg"
end
