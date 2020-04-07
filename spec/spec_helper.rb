ENV['ENVIRONMENT'] = 'test'

require_relative './setup_test_database'

require 'capybara/rspec'
require 'simplecov'
require 'simplecov-console'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

require File.join(File.dirname(__FILE__), '..', 'app.rb')
Capybara.app = BookmarkManager

RSpec.configure do |config|
  config.before(:each) do
    setup_test_database
  end

  config.after(:suite) do
    motivation = ['Read the stacktrace!', 'Remember to commit!','Solve the simplest problem!', 'Red Green Refactor!'].sample
    puts
    puts
    puts "\e[33m#{motivation}\e[0m"
  end
end
