ENV['RACK_ENV'] = 'test'
require File.join(File.dirname(__FILE__), '..', 'app.rb')
require 'database_helpers.rb'

require 'capybara/rspec'
require 'pg'

Capybara.app = Makersbnb

RSpec.configure do |config|
  config.before(:each) do
    set_up_database
  end

  config.after(:suite) do
    puts
    puts "\e[33mHave you considered running rubocop? It will help you improve your code!\e[0m"
    puts "\e[33mTry it now! Just run: rubocop\e[0m"
  end
end
